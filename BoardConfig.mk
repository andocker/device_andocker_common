BOARD_IS_CONTAINER := true

BOARD_DOCKER_ENVVARS := \
  INIT_KERNEL_CMDLINE \
  $(empty)
# See external/qemu/android/android-emu/android/main-kernel-parameters.cpp,
# function emulator_getKernelParameters for more.
BOARD_DOCKER_ENV_INIT_KERNEL_CMDLINE := \
  qemu=1 \
  androidboot.hardware=ranchu \
  android.bootanim=0 \
  android.qemud=1 \
  qemu.gles=1 \
  qemu.opengles.version=65536 \
  $(empty)

BOARD_DOCKER_VOLUMES := \
  /data \
  $(empty)

BOARD_DOCKER_ENTRYPOINT := "/init"
