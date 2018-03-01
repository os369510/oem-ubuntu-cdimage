#!/bin/sh

sudo apt-get update

cat server-pool-arch.list desktop-pool-arch.list | sort -u > xenial-classic-arch.list
sed 's/\*_\(amd64\|all\).deb//g' xenial-classic-arch.list > xenial-classic-pkgname.list

./update-packagelist && cat udebs.list xenial-classic-apt.list > xenial-classic.list
