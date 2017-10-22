#  File: 'C:\POCP\lab5\lab5\src\Task3_TB\Task3_tb1.do'
#  created: 10/22/17 20:57:13
#  from: 'C:\POCP\lab5\lab5\src\Task3.asf'
#  by ASFTEST - v.2.1.3 build 56, August 25, 2005

#
# rebuild the project
#
comp "C:\POCP\lab5\lab5\src\Task3.asf"
comp "C:\POCP\lab5\lab5\src\Task3_TB\Task3_tb1.vhd"

#
# set top-level and initialize the simulator with Code Coverage Data
#
asim -cc -cc_dest $DSN/coverage/Task3_cc_tb1 -cc_hierarchy -cc_all Task3_cfg_tb1

#
# invoke Waveform Viewer window, add signals to Waveform
#
wave
wave -noreg -dec cycle_num
wave -noreg CLK
wave -noreg UUT/NextState_Sreg0
wave -noreg UUT/Sreg0
wave -noreg test_Sreg0
wave -noreg IP
wave -noreg RST
wave -noreg OP

#
#
#
run -all
endsim
write wave "C:\POCP\lab5\lab5\src\Task3_TB\Task3_tb1.awf"
#close -wave
