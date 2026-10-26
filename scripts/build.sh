#!/bin/bash
#
# Build runtime-environment tarballs from packages/<name>/ into dist/<name>.tar.gz.
#
# Usage: scripts/build.sh [name ...]      (default: every package)
#
# The tarballs are reproducible: fixed owner, sorted entries, and every file
# dated to the package's last git commit, so the same source gives the same
# bytes. A package holds control/ (install, remove, runtime) and data/ (what
# gets installed), as GridFactory's RTE manager expects.

set -e
cd "$(dirname "$0")/.."
mkdir -p dist

[ $# -gt 0 ] || set -- $(ls packages)

for name in "$@"; do
	name=${name%/}
	name=${name#packages/}
	if [ ! -d "packages/$name/control" ]; then
		echo "Not a package (no control/): packages/$name" >&2
		exit 1
	fi
	stamp=$(git log -1 --format=%ct -- "packages/$name" 2>/dev/null || true)
	stamp=${stamp:-0}
	(cd "packages/$name" && tar --sort=name --owner=0 --group=0 --numeric-owner \
		--mtime="@$stamp" -cf - $(ls -A)) | gzip -n -9 > "dist/$name.tar.gz"
	echo "dist/$name.tar.gz"
done
