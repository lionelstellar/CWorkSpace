old-cmd-/home/jiangyikun/qemu_optee/my_dev/demo/ta/out/ta_entry_a32.o := arm-linux-gnueabihf-gcc -pipe -g -mcpu=cortex-a15 -marm -MD -MF /home/jiangyikun/qemu_optee/my_dev/demo/ta/out/.ta_entry_a32.o.d -MT /home/jiangyikun/qemu_optee/my_dev/demo/ta/out/ta_entry_a32.o -nostdinc -isystem /home/jiangyikun/qemu_optee/toolchains/aarch32/bin/../lib/gcc/arm-linux-gnueabihf/8.3.0/include -DCFG_TEE_TA_LOG_LEVEL=1 -I./include -DARM32=1 -D__ILP32__=1 -DMBEDTLS_SELF_TEST -DTRACE_LEVEL=1 -I. -I/home/jiangyikun/qemu_optee/optee_os/out/arm/export-ta_arm32/include -DCFG_TA_DYNLINK=1 -DCFG_TEE_TA_LOG_LEVEL='1' -DCFG_SYSTEM_PTA=1 -DCFG_UNWIND=1 -DCFG_ARM32_ta_arm32=1 -DCFG_TA_MBEDTLS=1 -DCFG_TA_MBEDTLS_SELF_TEST=1 -DCFG_TA_MBEDTLS_MPI=1 -DCFG_TA_FLOAT_SUPPORT=1 -D__FILE_ID__=ta_entry_a32_S -c /home/jiangyikun/qemu_optee/optee_os/out/arm/export-ta_arm32/src/ta_entry_a32.S -o /home/jiangyikun/qemu_optee/my_dev/demo/ta/out/ta_entry_a32.o