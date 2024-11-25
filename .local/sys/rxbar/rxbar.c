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

#define MAXLEN 7

time_t t;
char buf[MAXLEN + 2];
char buf2[MAXLEN + 2];
size_t len, len2;
struct tm td;
int fdt, fds, fdc;
time_t t1;

int main()
{
	fdt = open("/sys/class/power_supply/macsmc-battery/time_to_empty_now", O_RDONLY);
	fdc = open("/sys/class/power_supply/macsmc-battery/capacity", O_RDONLY);
	fds = open("/sys/class/power_supply/macsmc-battery/status", O_RDONLY);
	if (fdt == -1 || fds == -1) {
		fdt = open("/sys/class/power_supply/BAT0/time_to_empty_now", O_RDONLY);
		fdc = open("/sys/class/power_supply/BAT0/capacity", O_RDONLY);
		fds = open("/sys/class/power_supply/BAT0/status", O_RDONLY);
	}
	if (fdt == -1 || fds == -1) {
		// no battery
		for (;;) {
			t = time(NULL);
			td = *localtime(&t);
			dprintf(STDOUT_FILENO,
				"NOBAT %d-%02d-%02d %02d:%02d:%02d\n",
				td.tm_year + 1900,
				td.tm_mon + 1,
				td.tm_mday,
				td.tm_hour,
				td.tm_min,
				td.tm_sec
			);
			t = (t + 1) * 1000000;
			for (t1 = time(NULL) * 1000000; t1 < t; t1 = time(NULL) * 1000000)
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
		buf2[len2-1] = '\0';
		dprintf(STDOUT_FILENO,
			"%s.%s %d-%02d-%02d %02d:%02d:%02d\n",
			buf,
			buf2,
			td.tm_year + 1900,
			td.tm_mon + 1,
			td.tm_mday,
			td.tm_hour,
			td.tm_min,
			td.tm_sec
		);
		t = (t + 1) * 1000000;
		for (t1 = time(NULL) * 1000000; t1 < t; t1 = time(NULL) * 1000000)
			usleep(t - t1);
	}
}
