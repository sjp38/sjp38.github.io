#!/bin/bash

bindir=$(realpath $(dirname "$0"))
pushd "$bindir/.."
for f in $(ls ./)
do
	if [ "$f" = "src" ]
	then
		continue
	fi
	git rm -r "$f"
done

"$bindir/build.sh"
git add *
git commit -as -m "build"
