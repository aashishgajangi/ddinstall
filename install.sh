#!/bin/bash
parted --script /dev/sdc \
mklabel gpt \
mkpart primary 1MiB 513MiB \
mkpart primary 513MiB 15.6GiB
printf "partition stage done\n"
dd if=/dev/sda1 of=/dev/sdc1 bs=8M status=progress
printf "stage2 completed\n"
dd if=/dev/sda2 of=/dev/sdc2 bs=8M status=progress
sync
printf "stage3 completed\n"
