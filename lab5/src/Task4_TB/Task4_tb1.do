#  File: 'C:\POCP\lab5\lab5\src\Task4_TB\Task4_tb1.do'
#  created: 10/22/17 21:03:46
#  from: 'C:\POCP\lab5\lab5\src\Task4.asf'
#  by ASFTEST - v.2.1.3 build 56, August 25, 2005

#
# rebuild the project
#
comp "C:\POCP\lab5\lab5\src\Task4.asf"
comp "C:\POCP\lab5\lab5\src\Task4_TB\Task4_tb1.vhd"

#
# set top-level and initialize the simulator with Code Coverage Data
#
asim -cc -cc_dest $DSN/coverage/Task4_cc_tb1 -cc_hierarchy -cc_all Task4_cfg_tb1

#
# invoke Waveform Viewer window, add signals to Waveform
#
wave
wave -noreg -dec cycle_num
wave -noreg CLK
wave -noreg UUT/NextState_Sreg0
wave -noreg UUT/Sreg0
wave -noreg test_Sreg0
wave -noreg RST
wave -noreg IP
wave -noreg OP

#
#
#
run -all
endsim
write wave "C:\POCP\lab5\lab5\src\Task4_TB\Task4_tb1.awf"
#close -wave
