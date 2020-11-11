#!/bin/bash

# We need to run as root to mount the disk image.
if test "`whoami`" != "root"; then
	echo "Please run as root."
	exit
fi

# Make sure the disk image exists.
if [ ! -e images/RM-DOS.flp ]
then
	echo "Disk image does not exist - creating a new one..."
	mkdosfs -C images/RM-DOS.flp 1440 || exit
fi

# Build bootloader.
echo "Building bootloader..."
nasm -O0 -w+orphan-labels -f bin -o src/bootloader/boot.bin src/bootloader/boot.asm || exit

# Write bootloader to the first sector of the floppy image.
echo "Writing bootloader..."
dd status=noxfer conv=notrunc if=src/bootloader/boot.bin of=images/RM-DOS.flp || exit

# Compile the C kernel.
echo "Building kernel..."
cd src/kernel
smlrc -no-externs kernel.c kernel-main.asm
cd ../../

# Combine C kernel with ASM Boot2.
echo "Assembling kernel..."
#nasm -O0 -w+orphan-labels -f bin -o src/kernel/kernel.bin src/kernel/kernel-init.asm || exit
nasm -O0 -w+orphan-labels -f bin -o src/kernel/kernel.bin src/kernel/kernel-main.asm || exit


# Write kernel to floppy image.
echo "Mounting disk image..."
rm -rf tmp-loop
mkdir tmp-loop
mount -o loop -t vfat images/RM-DOS.flp tmp-loop
cp src/kernel/kernel.bin tmp-loop
sync
sleep 0.2
umount tmp-loop || exit
rm -rf tmp-loop

# Run QEMU
echo "Testing..."
qemu-system-x86_64 -fda images/RM-DOS.flp
