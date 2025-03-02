/*
 * Stupid status bar.
 * Written by Runxi Yu.
 * SPDX-License-Identifier: CC0-1.0
 */

#include <stdio.h>
#include <time.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#define MAXLEN 7

time_t t;
char buf[MAXLEN + 2];
char buf2[MAXLEN + 2];
size_t len, len2;
struct tm td;
int fdt, fds, fdc;
time_t t1;
char dmesg_buf[1024];

void get_latest_dmesg(char *buffer, size_t size)
{
	FILE *fp =
	    popen("sed ':a;N;$!ba;s/\\n/ :: /g' ~/Personal/scratch.txt", "r");
	if (fp == NULL) {
		perror("popen failed");
		return;
	}
	if (fgets(buffer, size, fp) == NULL) {
		perror("fgets failed");
		pclose(fp);
		return;
	}
	unsigned long end = strlen(buffer) - 1;
	if (buffer[end] == '\n')
		buffer[end] = 0;

	pclose(fp);
}

int main()
{
	fdt =
	    open("/sys/class/power_supply/macsmc-battery/time_to_empty_now",
		 O_RDONLY);
	fdc = open("/sys/class/power_supply/macsmc-battery/capacity", O_RDONLY);
	fds = open("/sys/class/power_supply/macsmc-battery/status", O_RDONLY);
	if (fdc == -1 || fds == -1) {
		fdt =
		    open("/sys/class/power_supply/BAT0/time_to_empty_now",
			 O_RDONLY);
		fdc = open("/sys/class/power_supply/BAT0/capacity", O_RDONLY);
		fds = open("/sys/class/power_supply/BAT0/status", O_RDONLY);
	}
	if (fdc == -1 || fds == -1) {
		// no battery
		for (;;) {
			t = time(NULL);
			td = *localtime(&t);
			get_latest_dmesg(dmesg_buf, sizeof(dmesg_buf));
			dprintf(STDOUT_FILENO,
				"%s    NOBAT %02d-%02d %02d:%02d:%02d\n",
				dmesg_buf,
				td.tm_mon + 1,
				td.tm_mday, td.tm_hour, td.tm_min, td.tm_sec);
			t = (t + 1) * 1000000;
			for (t1 = time(NULL) * 1000000; t1 < t;
			     t1 = time(NULL) * 1000000)
				usleep(t - t1);
		}
	}
	for (;;) {
		// battery present
		t = time(NULL);
		td = *localtime(&t);
		len = pread(fdc, buf + 1, MAXLEN, 0);
		pread(fds, buf, 1, 0);
		len2 = pread(fdt, buf2, MAXLEN, 0);
		buf[len] = '\0';
		buf2[len2 - 1] = '\0';
		get_latest_dmesg(dmesg_buf, sizeof(dmesg_buf));
		int percentage = atoi(buf+1);
		dprintf(STDERR_FILENO, "%d\n", percentage);
		if (percentage < 11 && buf[0] != 'C') {
			dprintf(STDOUT_FILENO,
				"%s    <span background=\"#ff0000\" foreground=\"#ffffff\">%s.%s</span> %02d-%02d %02d:%02d:%02d\n",
				dmesg_buf,
				buf,
				buf2,
				td.tm_mon + 1,
				td.tm_mday, td.tm_hour, td.tm_min, td.tm_sec);
		} else if (percentage < 21) {
			dprintf(STDOUT_FILENO,
				"%s    <span foreground=\"#ff2222\">%s.%s</span> %02d-%02d %02d:%02d:%02d\n",
				dmesg_buf,
				buf,
				buf2,
				td.tm_mon + 1,
				td.tm_mday, td.tm_hour, td.tm_min, td.tm_sec);
		} else {
			dprintf(STDOUT_FILENO,
				"%s    %s.%s %02d-%02d %02d:%02d:%02d\n",
				dmesg_buf,
				buf,
				buf2,
				td.tm_mon + 1,
				td.tm_mday, td.tm_hour, td.tm_min, td.tm_sec);
		}
		t = (t + 1) * 1000000;
		for (t1 = time(NULL) * 1000000; t1 < t;
		     t1 = time(NULL) * 1000000)
			usleep(t - t1);
	}
}
