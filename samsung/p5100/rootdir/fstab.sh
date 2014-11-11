#!/sbin/busybox sh
# Copyright 2014 Tuxafgmur - Dhollmen
# NOTE: This script assumes encrypted partitions are ext4 format.

STABFILE=/fstab.espresso10

	echo '# Samsung Tab2
# Dhollmen

#                                                        mnt_point    type    options & mnt_flags                                                                                    fs_mgr_flags' > $STABFILE

/sbin/busybox blkid -s TYPE /dev/block/mmcblk0p9 | /sbin/busybox grep -q f2fs
if [ "$?" = "0" ]; then
	echo '/dev/block/platform/omap/omap_hsmmc.1/by-name/FACTORYFS  /system      f2fs    ro,noatime,nodiratime,background_gc=off,inline_xattr,active_logs=2                                     wait' >> $STABFILE
else
	echo '/dev/block/platform/omap/omap_hsmmc.1/by-name/FACTORYFS  /system      ext4    noatime,nodiratime,nosuid,nodev,barrier=0,noauto_da_alloc,journal_async_commit,data=writeback          wait' >> $STABFILE
fi

	echo '/dev/block/platform/omap/omap_hsmmc.1/by-name/EFS        /efs         ext4    noatime,nodiratime,nosuid,nodev,barrier=0                                                              wait,check' >> $STABFILE


/sbin/busybox blkid -s TYPE /dev/block/mmcblk0p7 | /sbin/busybox grep -q f2fs
if [ "$?" = "0" ]; then
	echo '/dev/block/platform/omap/omap_hsmmc.1/by-name/CACHE      /cache       f2fs    noatime,nodiratime,nosuid,nodev,background_gc=off,inline_xattr,active_logs=2                           wait' >> $STABFILE
else
	echo '/dev/block/platform/omap/omap_hsmmc.1/by-name/CACHE      /cache       ext4    noatime,nodiratime,nosuid,nodev,barrier=0,noauto_da_alloc,journal_async_commit,data=writeback          wait,check' >> $STABFILE
fi


/sbin/busybox blkid -s TYPE /dev/block/mmcblk0p11 | /sbin/busybox grep -q ext4
if [ "$?" = "0" ]; then
	echo '/dev/block/platform/omap/omap_hsmmc.1/by-name/HIDDEN     /preload     ext4    noatime,nodiratime,nosuid,nodev,barrier=0,noauto_da_alloc,journal_async_commit,data=writeback          wait,check' >> $STABFILE
else
	/sbin/busybox blkid -s TYPE /dev/block/mmcblk0p11 | /sbin/busybox grep -q f2fs
	if [ "$?" = "0" ]; then
		echo '/dev/block/platform/omap/omap_hsmmc.1/by-name/HIDDEN     /preload     f2fs    noatime,nodiratime,nosuid,nodev,background_gc=off,inline_xattr,active_logs=2                           wait' >> $STABFILE
	fi
fi

/sbin/busybox blkid -s TYPE /dev/block/mmcblk0p10 | /sbin/busybox grep -q f2fs
if [ "$?" = "0" ]; then
	echo '/dev/block/platform/omap/omap_hsmmc.1/by-name/DATAFS     /data        f2fs    noatime,nodiratime,nosuid,nodev,background_gc=off,inline_xattr,active_logs=2                           wait,encryptable=footer' >> 	$STABFILE
else
	echo '/dev/block/platform/omap/omap_hsmmc.1/by-name/DATAFS     /data        ext4    noatime,nodiratime,nosuid,nodev,barrier=0,noauto_da_alloc,journal_async_commit,data=writeback          wait,check,encryptable=footer' >> $STABFILE
fi


	echo '
# vold-managed volumes
/devices/platform/omap/omap_hsmmc.0/mmc_host/mmc1        auto         auto    defaults    voldmanaged=sdcard1:auto
/devices/platform/omap/musb-omap2430/musb-hdrc/usb1      auto         auto    defaults    voldmanaged=usbdisk0:auto

# recovery
/dev/block/mmcblk0p5                                     /boot        emmc    defaults    recoveryonly
/dev/block/mmcblk0p6                                     /recovery    emmc    defaults    recoveryonly
/dev/block/mmcblk1p1                                     /external_sd auto    defaults    recoveryonly' >> $STABFILE


[ "$1" != "recovery" ] && /sbin/busybox rm /sbin/fstab.sh
[ "$1" != "recovery" ] && /sbin/busybox rm /sbin/busybox
