# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# IP: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.srcs/sources_1/ip/cpu/cpu.xci
# IP: The module: 'cpu' is the root of the design. Do not add the DONT_TOUCH constraint.

# Block Designs: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/bd_3914.bd
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==bd_3914 || ORIG_REF_NAME==bd_3914} -quiet] -quiet

# IP: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_0/bd_3914_microblaze_I_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==bd_3914_microblaze_I_0 || ORIG_REF_NAME==bd_3914_microblaze_I_0} -quiet] -quiet

# IP: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_1/bd_3914_rst_0_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==bd_3914_rst_0_0 || ORIG_REF_NAME==bd_3914_rst_0_0} -quiet] -quiet

# IP: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_2/bd_3914_ilmb_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==bd_3914_ilmb_0 || ORIG_REF_NAME==bd_3914_ilmb_0} -quiet] -quiet

# IP: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_3/bd_3914_dlmb_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==bd_3914_dlmb_0 || ORIG_REF_NAME==bd_3914_dlmb_0} -quiet] -quiet

# IP: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_4/bd_3914_dlmb_cntlr_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==bd_3914_dlmb_cntlr_0 || ORIG_REF_NAME==bd_3914_dlmb_cntlr_0} -quiet] -quiet

# IP: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_5/bd_3914_ilmb_cntlr_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==bd_3914_ilmb_cntlr_0 || ORIG_REF_NAME==bd_3914_ilmb_cntlr_0} -quiet] -quiet

# IP: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_6/bd_3914_lmb_bram_I_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==bd_3914_lmb_bram_I_0 || ORIG_REF_NAME==bd_3914_lmb_bram_I_0} -quiet] -quiet

# IP: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_7/bd_3914_iomodule_0_0.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==bd_3914_iomodule_0_0 || ORIG_REF_NAME==bd_3914_iomodule_0_0} -quiet] -quiet

# XDC: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_0/bd_3914_microblaze_I_0.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==bd_3914_microblaze_I_0 || ORIG_REF_NAME==bd_3914_microblaze_I_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_0/bd_3914_microblaze_I_0_ooc_debug.xdc

# XDC: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_1/bd_3914_rst_0_0_board.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==bd_3914_rst_0_0 || ORIG_REF_NAME==bd_3914_rst_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_1/bd_3914_rst_0_0.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==bd_3914_rst_0_0 || ORIG_REF_NAME==bd_3914_rst_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_3/bd_3914_dlmb_0.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==bd_3914_dlmb_0 || ORIG_REF_NAME==bd_3914_dlmb_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_6/bd_3914_lmb_bram_I_0_ooc.xdc

# XDC: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_7/bd_3914_iomodule_0_0_board.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==bd_3914_iomodule_0_0 || ORIG_REF_NAME==bd_3914_iomodule_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/bd_3914_ooc.xdc

# XDC: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/cpu_board.xdc
# XDC: The top module name and the constraint reference have the same name: 'cpu'. Do not add the DONT_TOUCH constraint.
set_property KEEP_HIERARCHY SOFT [get_cells inst -quiet] -quiet

# XDC: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/cpu_ooc.xdc
# XDC: The top module name and the constraint reference have the same name: 'cpu'. Do not add the DONT_TOUCH constraint.
#dup# set_property KEEP_HIERARCHY SOFT [get_cells inst -quiet] -quiet

# IP: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.srcs/sources_1/ip/cpu/cpu.xci
# IP: The module: 'cpu' is the root of the design. Do not add the DONT_TOUCH constraint.

# Block Designs: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/bd_3914.bd
#dup# set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==bd_3914 || ORIG_REF_NAME==bd_3914} -quiet] -quiet

# IP: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_0/bd_3914_microblaze_I_0.xci
#dup# set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==bd_3914_microblaze_I_0 || ORIG_REF_NAME==bd_3914_microblaze_I_0} -quiet] -quiet

# IP: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_1/bd_3914_rst_0_0.xci
#dup# set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==bd_3914_rst_0_0 || ORIG_REF_NAME==bd_3914_rst_0_0} -quiet] -quiet

# IP: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_2/bd_3914_ilmb_0.xci
#dup# set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==bd_3914_ilmb_0 || ORIG_REF_NAME==bd_3914_ilmb_0} -quiet] -quiet

# IP: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_3/bd_3914_dlmb_0.xci
#dup# set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==bd_3914_dlmb_0 || ORIG_REF_NAME==bd_3914_dlmb_0} -quiet] -quiet

# IP: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_4/bd_3914_dlmb_cntlr_0.xci
#dup# set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==bd_3914_dlmb_cntlr_0 || ORIG_REF_NAME==bd_3914_dlmb_cntlr_0} -quiet] -quiet

# IP: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_5/bd_3914_ilmb_cntlr_0.xci
#dup# set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==bd_3914_ilmb_cntlr_0 || ORIG_REF_NAME==bd_3914_ilmb_cntlr_0} -quiet] -quiet

# IP: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_6/bd_3914_lmb_bram_I_0.xci
#dup# set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==bd_3914_lmb_bram_I_0 || ORIG_REF_NAME==bd_3914_lmb_bram_I_0} -quiet] -quiet

# IP: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_7/bd_3914_iomodule_0_0.xci
#dup# set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==bd_3914_iomodule_0_0 || ORIG_REF_NAME==bd_3914_iomodule_0_0} -quiet] -quiet

# XDC: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_0/bd_3914_microblaze_I_0.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==bd_3914_microblaze_I_0 || ORIG_REF_NAME==bd_3914_microblaze_I_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_0/bd_3914_microblaze_I_0_ooc_debug.xdc

# XDC: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_1/bd_3914_rst_0_0_board.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==bd_3914_rst_0_0 || ORIG_REF_NAME==bd_3914_rst_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_1/bd_3914_rst_0_0.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==bd_3914_rst_0_0 || ORIG_REF_NAME==bd_3914_rst_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_3/bd_3914_dlmb_0.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==bd_3914_dlmb_0 || ORIG_REF_NAME==bd_3914_dlmb_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_6/bd_3914_lmb_bram_I_0_ooc.xdc

# XDC: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/ip/ip_7/bd_3914_iomodule_0_0_board.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==bd_3914_iomodule_0_0 || ORIG_REF_NAME==bd_3914_iomodule_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/bd_0/bd_3914_ooc.xdc

# XDC: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/cpu_board.xdc
# XDC: The top module name and the constraint reference have the same name: 'cpu'. Do not add the DONT_TOUCH constraint.
#dup# set_property KEEP_HIERARCHY SOFT [get_cells inst -quiet] -quiet

# XDC: c:/Users/jordan_edwards4/Documents/SOC2/VanillaSystem/VanillaSystem.gen/sources_1/ip/cpu/cpu_ooc.xdc
# XDC: The top module name and the constraint reference have the same name: 'cpu'. Do not add the DONT_TOUCH constraint.
#dup# set_property KEEP_HIERARCHY SOFT [get_cells inst -quiet] -quiet