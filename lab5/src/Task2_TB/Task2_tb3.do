#  File: 'C:\POCP\lab5\lab5\src\Task2_TB\Task2_tb3.do'
#  created: 10/22/17 20:53:26
#  from: 'C:\POCP\lab5\lab5\src\Task2.asf'
#  by ASFTEST - v.2.1.3 build 56, August 25, 2005

#
# rebuild the project
#
comp "C:\POCP\lab5\lab5\src\Task2.asf"
comp "C:\POCP\lab5\lab5\src\Task2_TB\Task2_tb3.vhd"

#
# set top-level and initialize the simulator with Code Coverage Data
#
asim -cc -cc_dest $DSN/coverage/Task2_cc_tb3 -cc_hierarchy -cc_all Task2_cfg_tb3

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
write wave "C:\POCP\lab5\lab5\src\Task2_TB\Task2_tb3.awf"
#close -wave
