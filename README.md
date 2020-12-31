----Thanks for xen0n, ferhung, fire855 who are contributing to the working CyanogenMod of MTK hardware.---

This is a device tree for mediatek mt6580 ROW which is based on mt6580 SoC. Powered by Hikari no Tenshi.
# Build

* init
  Sync LINEAGE OS source:

        # repo init -u git://github.com/LineageOS/android.git -b cm-14.1        
        # repo sync

* full build
        
        # source build/envsetup.sh
        # breakfast x20
        # croot
        # brunch x20

# Limitations

Services requires root:

`system/core/rootdir/init.rc`

  * surfaceflinger depends on sched_setscheduler calls, unable to change process priority from 'system' user (default user 'system')

  * mediaserver depends on /data/nvram folder access, unable to do voice calls from 'media' user (default user 'media')
