#!/bin/bash
#
# Upload files to the batch site on every service and check that each one then
# serves exactly the local bytes.
#
# Usage: SITE_USER=... SITE_PASSWORD=... scripts/publish.sh FILE...
#
#   dist/<package>.tar.gz, catalog/rtes.xml, catalog/rtes.xsl, assets/*  ->  rtes/
#   vos/*.txt                                                             ->  vos/
#   site/<path>.md                                                        ->  <path>.md
#
# Until the old service is retired both copies are kept identical: the old
# service stores the site in the account's kubefiles/batch, the new one in
# sites/batch. Public URLs (https://sciencedata.dk/public/rtes/...,
# https://sciencedata.dk/sites/batch/...) are the same on both. At the switch,
# drop the old entry from TARGETS.

set -e
cd "$(dirname "$0")/.."

if [ -z "$SITE_USER" ] || [ -z "$SITE_PASSWORD" ]; then
	echo "Set SITE_USER and SITE_PASSWORD (the account that owns the batch site)." >&2
	exit 1
fi

# "<WebDAV base of the site folder> <public base URL of the service>"
TARGETS=(
	"https://sciencedata.dk/remote.php/webdav/kubefiles/batch https://sciencedata.dk"
	"https://lab.sciencedata.dk/remote.php/dav/files/$SITE_USER/sites/batch https://lab.sciencedata.dk"
)

[ $# -gt 0 ] || { sed -n '2,13p' "$0"; exit 1; }

status=0
for file in "$@"; do
	[ -f "$file" ] || { echo "No such file: $file" >&2; status=1; continue; }
	base=$(basename "$file")
	case "$file" in
		dist/*|catalog/*|assets/*) dest="rtes/$base"; public="public/rtes/$base" ;;
		vos/*)                     dest="vos/$base";  public="sites/batch/vos/$base" ;;
		site/*)                    dest="${file#site/}"; public="" ;;
		*) echo "Don't know where $file goes" >&2; status=1; continue ;;
	esac
	want=$(sha256sum "$file" | cut -d' ' -f1)
	for target in "${TARGETS[@]}"; do
		read -r dav web <<< "$target"
		code=$(curl -s -o /dev/null -w '%{http_code}' --max-time 3600 \
			-u "$SITE_USER:$SITE_PASSWORD" -T "$file" "$dav/$dest")
		if [[ $code != 20[14] ]]; then
			echo "FAILED  $web  $dest  (HTTP $code)"; status=1; continue
		fi
		if [ -n "$public" ]; then
			got=$(curl -sL --max-time 3600 "$web/$public" | sha256sum | cut -d' ' -f1)
			if [ "$got" != "$want" ]; then
				echo "DIFFERS $web/$public"; status=1; continue
			fi
		fi
		echo "ok      $web  $dest"
	done
done
exit $status
