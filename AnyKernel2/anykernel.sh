# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
kernel.string=Spherical Kernel - Spherical Ice
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=cedric
device.name2=cedric_retail
} # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel permissions
# set permissions for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;

## AnyKernel install
dump_boot;

# begin ramdisk changes
backup_file init.rc
insert_line init.rc "init.sphere.rc" after "import /init.environ.rc" "import /init.sphere.rc";
#replace_line "/init.qcom.rc" "write /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq 1401600" "write /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq 1094400";
#replace_line "/init.qcom.rc" "85 1401600:80" "1 960000:85 1094400:90 1344000:80";
#replace_line "/init.qcom.rc" "write /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq 652800" "write /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq 960000";
# end ramdisk changes

write_boot;

## end install

