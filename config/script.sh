#!/bin/bash
# Don't run this script unless you know what you're doing.

git checkout master
for i in gr aie aif core
do
	git merge $i
	git checkout $i
	git merge master
	git checkout master
done

git checkout master
