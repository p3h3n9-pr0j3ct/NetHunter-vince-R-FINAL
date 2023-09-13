# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=
do.devicecheck=0
do.modules=1
do.systemless=1
do.cleanup=1
do.cleanuponabort=1
'; } # end properties

# shell variables
block=auto;
is_slot_device=auto;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel install
dump_boot;

#Mounting
ui_print " "
ui_print " "
ui_print "Mounting system and vendor partitions..."
mount -o remount,rw /system
mount -o remount,rw /vendor
sleep 3

#Remove Old Modules
ui_print " "
ui_print " "
ui_print "Removing Old Modules..."
rm -rf /system/lib/modules
rm -rf /vendor/lib/modules
sleep 3

#Install Magisk Module
ui_print " "
ui_print " "
ui_print "Installing Magisk Module..."
cp -rf /tmp/anykernel/AutoInsmodModules /data/adb/modules
sleep 3

write_boot;
