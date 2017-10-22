#  File: 'C:\POCP\lab5\lab5\src\Task_1_TB\Task_1_tb3.do'
#  created: 10/22/17 20:42:43
#  from: 'C:\POCP\lab5\lab5\src\Task_1.asf'
#  by ASFTEST - v.2.1.3 build 56, August 25, 2005

#
# rebuild the project
#
comp "C:\POCP\lab5\lab5\src\Task_1.asf"
comp "C:\POCP\lab5\lab5\src\Task_1_TB\Task_1_tb3.vhd"

#
# set top-level and initialize the simulator with Code Coverage Data
#
asim -cc -cc_dest $DSN/coverage/Task_1_cc_tb3 -cc_hierarchy -cc_all Task_1_cfg_tb3

#
# invoke Waveform Viewer window, add signals to Waveform
#
wave
wave -noreg -dec cycle_num
wave -noreg CLK
wave -noreg UUT/NextState_state
wave -noreg UUT/state
wave -noreg test_state
wave -noreg IP
wave -noreg RST
wave -noreg OP

#
#
#
run -all
endsim
write wave "C:\POCP\lab5\lab5\src\Task_1_TB\Task_1_tb3.awf"
#close -wave
