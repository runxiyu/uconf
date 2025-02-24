// SPDX-License-Identifier: BSD-2-Clause

#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <glob.h>

// keep this sorted
const char *acceptable_governors[] = {
	"conservative",
	"ondemand",
	"performance",
	"powersave",
	"schedutil",
	"userspace",
};

int
elemcmp(const void *a, const void *b)
{
	return strcmp((char *)a, *(const char **)b);
}

int
main(int argc, char **argv)
{
	if (argc != 2) {
		dprintf(2, "%s: missing governor argument\n", argv[0]);
		return 1;
	}

	if (bsearch(
		argv[1],
		acceptable_governors,
		sizeof(acceptable_governors)/sizeof(*acceptable_governors),
		sizeof(*acceptable_governors),
		elemcmp
	) == NULL) {
		dprintf(2, "%s: invalid governor\n", argv[0]);
		return 5;
	}

	glob_t pglob;
	int err;
	if (!(err = glob("/sys/devices/system/cpu/cpu*/cpufreq/scaling_governor", GLOB_NOESCAPE | GLOB_ERR, NULL, &pglob))) {
		switch (err) {
		case GLOB_NOSPACE:
			dprintf(2, "%s: out of memory\n", argv[0]);
			return 2;
		case GLOB_ABORTED:
			dprintf(2, "%s: read error\n", argv[0]);
			return 3;
		case GLOB_NOMATCH:
			dprintf(2, "%s: no cpus with scaling\n", argv[0]);
			return 4;
		}
	};

	for (size_t i = 0; i < pglob.gl_pathc; ++i) {
		int fd = open(pglob.gl_pathv[i], O_WRONLY);
		if (fd == -1) {
			dprintf(2, "%s: can't open %s\n", argv[0], pglob.gl_pathv[i]);
			return 6;
		}
		ssize_t wl = (write(fd, argv[1], strlen(argv[1]) + 1));
		if (wl == -1) {
			dprintf(2, "%s: can't write to %s\n", argv[0], pglob.gl_pathv[i]);
			return 7;
		} else if (wl == strlen(argv[1] + 1)) {
		} else {
			dprintf(2, "%s: incomplete write to %s, continue...\n", argv[0], pglob.gl_pathv[i]);
		}
		if (close(fd) == -1) {
			dprintf(2, "%s: can't close %s\n", argv[0], pglob.gl_pathv[i]);
			return 9;
		}
	}
	globfree(&pglob);

	return 0;
}
