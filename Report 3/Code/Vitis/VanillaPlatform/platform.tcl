# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\jordan_edwards4\Documents\SOC2\Vitis\VanillaPlatform\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\jordan_edwards4\Documents\SOC2\Vitis\VanillaPlatform\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {VanillaPlatform}\
-hw {C:\Users\jordan_edwards4\Documents\SOC2\VanillaSystem\mcs_top_vanilla.xsa}\
-proc {microblaze_I} -os {standalone} -out {C:/Users/jordan_edwards4/Documents/SOC2/Vitis}

platform write
platform generate -domains 
platform active {VanillaPlatform}
platform generate
