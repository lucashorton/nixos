#!/bin/sh

# Replace /dev/sdX with your actual drive device
DRIVE="/dev/vda"

# Create a partition table
sfdisk $DRIVE <<EOF
label: gpt
device: $DRIVE
unit: sectors

# 1GB EFI partition
,$((1024 * 1024 * 1024 / 512)),U,*
# Remaining space for Linux partition
,,L
EOF

echo "Partitioning complete. New partition table:"
fdisk -l $DRIVE

PART1 = "${DRIVE}1"
PART2 = "${DRIVE}2"

mkfs.ext4 -F 32 -n BOOT $PART1

cryptsetup luksFormat $PART2
cryptsetup open $PART2 cryptroot
mkfs.btrfs /dev/mapper/cryptroot
mount /dev/mapper/cryptroot /mnt

btrfs subvolume create /mnt/@root
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@nix
btrfs subvolume create /mnt/@persist
btrfs subvolume create /mnt/@log

umount /mnt

mount -o compress=lzo,subvol=@root /dev/mapper/cryptroot /mnt
mkdir -p /mnt/home /mnt/nix /mnt/persist /mnt/var/log
mount -o compress=lzo,subvol=@home /dev/mapper/cryptroot /mnt/home
mount -o compress=lzo,subvol=@nix /dev/mapper/cryptroot /mnt/nix
mount -o compress=lzo,subvol=@persist /dev/mapper/cryptroot /mnt/persist
mount -o compress=lzo,subvol=@log /dev/mapper/cryptroot /mnt/var/log
