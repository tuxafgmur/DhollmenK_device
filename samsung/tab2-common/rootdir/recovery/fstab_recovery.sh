#!/sbin/busybox sh
# Copyright 2014 Tuxafgmur - Dhollmen

STABFILE=/fstab.$1
/sbin/fstab.sh $1 recovery
cp -f $STABFILE /etc/recovery.fstab

TRWFSTABFILE=/etc/twrp.fstab

	echo "# Samsung Tab2 - $1
# Dhollmen

# mount      fstype	device" > $TRWFSTABFILE

/sbin/busybox blkid -s TYPE /dev/block/mmcblk0p9 | /sbin/busybox grep -q f2fs
if [ "$?" = "0" ]; then
	echo '/system      f2fs       /dev/block/mmcblk0p9' >> $TRWFSTABFILE
else
	echo '/system      ext4       /dev/block/mmcblk0p9' >> $TRWFSTABFILE
fi

/sbin/busybox blkid -s TYPE /dev/block/mmcblk0p7 | /sbin/busybox grep -q f2fs
if [ "$?" = "0" ]; then
	echo '/cache       f2fs       /dev/block/mmcblk0p7' >> $TRWFSTABFILE
else
	echo '/cache       ext4       /dev/block/mmcblk0p7' >> $TRWFSTABFILE
fi

/sbin/busybox blkid -s TYPE /dev/block/mmcblk0p10 | /sbin/busybox grep -q f2fs
if [ "$?" = "0" ]; then
	echo '/data        f2fs       /dev/block/mmcblk0p10	length=-16384' >> $TRWFSTABFILE
else
	echo '/data        ext4       /dev/block/mmcblk0p10	length=-16384' >> $TRWFSTABFILE
fi

	echo '/efs         ext4       /dev/block/mmcblk0p1	flags=display="EFS";backup=1' >> $TRWFSTABFILE

	echo '/boot        emmc       /dev/block/mmcblk0p5' >> $TRWFSTABFILE

	echo '/recovery    emmc       /dev/block/mmcblk0p6' >> $TRWFSTABFILE

	echo '/bootloader  emmc       /dev/block/mmcblk0p2' >> $TRWFSTABFILE

/sbin/busybox blkid -s TYPE /dev/block/mmcblk0p11 | /sbin/busybox grep -q ext4
if [ "$?" = "0" ]; then
	echo '/preload     ext4       /dev/block/mmcblk0p11' >> $TRWFSTABFILE
else
	/sbin/busybox blkid -s TYPE /dev/block/mmcblk0p11 | /sbin/busybox grep -q f2fs
	if [ "$?" = "0" ]; then
		echo '/preload     f2fs       /dev/block/mmcblk0p11' >> $TRWFSTABFILE
	fi
fi

	echo '/external_sd vfat       /dev/block/mmcblk1p1	/dev/block/mmcblk1  flags=display="Micro SDcard";storage;wipeingui;removable' >> $TRWFSTABFILE

	echo '/usb-otg     vfat       /dev/block/sda1		/dev/block/sda      flags=display="USB-OTG";storage;wipeingui;removable' >> $TRWFSTABFILE
