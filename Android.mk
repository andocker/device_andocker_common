_has_qemu := $(filter qemu=%,$(BOARD_KERNEL_CMDLINE))
ADDITIONAL_DEFAULT_PROPERTIES += \
  $(foreach p,$(BOARD_KERNEL_CMDLINE), \
    $(eval _key := $(word 1,$(subst =,$(space),$(p)))) \
    $(eval _value := $(word 2,$(subst =,$(space),$(p)))) \
    $(if $(filter x,$(_key)x $(_value)x),, \
      $(if $(_has_qemu),ro.kernel.$(_key)=$(_value)) \
      $(if $(filter androidboot.%,$(_key)), \
        $(subst androidboot.,ro.boot.,$(_key))=$(_value) \
      ) \
    ) \
  )
_has_qemu :=

