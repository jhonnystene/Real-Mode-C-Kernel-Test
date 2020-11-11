#!/bin/bash
if test "`whoami`" != "root"; then
	echo "Please run as root."
	exit
fi

if [ ! -e images/RM-DOS.flp ]
then
	echo "Disk image does not exist - creating a new one..."
	mkdosfs -C images/RM-DOS.flp 1440 || exit
fi

echo "Building bootloader..."
nasm -O0 -w+orphan-labels -f bin -o src/bootloader/boot.bin src/bootloader/boot.asm || exit

echo "Writing bootloader..."
dd status=noxfer conv=notrunc if=src/bootloader/boot.bin of=images/RM-DOS.flp || exit

echo "Building kernel..."
cd src/kernel
smlrc -no-externs kernel.c kernel-main.asm
cd ../../

echo "Assembling kernel..."
nasm -O0 -w+orphan-labels -f bin -o src/kernel/kernel.bin src/kernel/kernel-init.asm || exit

echo "Mounting disk image..."
rm -rf tmp-loop
mkdir tmp-loop
mount -o loop -t vfat images/RM-DOS.flp tmp-loop
cp src/kernel/kernel.bin tmp-loop
sync
sleep 0.2
umount tmp-loop || exit
rm -rf tmp-loop

echo "Testing..."
qemu-system-x86_64 -fda images/RM-DOS.flp
