-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : 
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : C:\POCP\lab5\lab5\src\Task_1_TB\Task_1_tb1.vhd
-- Generated   : 10/22/17 20:42:43
-- From        : C:\POCP\lab5\lab5\src\Task_1.asf
-- By          : ASFTEST ver. v.2.1.3 build 56, August 25, 2005
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


library IEEE;
use IEEE.STD_LOGIC_TEXTIO.all;
use STD.TEXTIO.all;

entity Task_1_ent_tb1 is
end entity Task_1_ent_tb1;

architecture Task_1_arch_tb1 of Task_1_ent_tb1 is
  constant delay_wr_in : Time := 5 ns;
  constant delay_pos_edge : Time := 5 ns;
  constant delay_wr_out : Time := 5 ns;
  constant delay_neg_edge : Time := 5 ns;

  file RESULTS : Text open WRITE_MODE is "results.txt";

  procedure WRITE_RESULTS(
    constant  IP : in Std_logic_Vector (3 downto 0);
    constant  RST : in Std_logic;
    constant  CLK : in Std_logic;
    constant  OP : in Std_logic_Vector (1 downto 0)
 ) is
     variable l_out : Line;
  begin
     WRITE(l_out, now, right, 15, ps);
     -- write input signals
     WRITE(l_out, IP, right, 11);
     WRITE(l_out, RST, right, 8);
     WRITE(l_out, CLK, right, 8);
     -- write output signals
     WRITE(l_out, OP, right, 9);
     WRITELINE(RESULTS, l_out);
  end;

  component Task1 is
    port(
      IP : in Std_logic_Vector (3 downto 0);
      RST : in Std_logic;
      CLK : in Std_logic;
      OP :out Std_logic_Vector (1 downto 0));
  end component; -- Task1;

 signal IP : Std_logic_Vector (3 downto 0);
 signal RST : Std_logic;
 signal CLK : Std_logic;
 signal OP : Std_logic_Vector (1 downto 0);

 signal cycle_num : Integer; -- takt number

-- this signal is added for compare test simulation results only
type test_state_type is (S0, S1, S3, S4, S2, any_state);
signal  test_state : test_state_type;


begin
   UUT : Task1
   port map(
    IP => IP,
    RST => RST,
    CLK => CLK,
    OP => OP);

 STIMULI : process
 begin
 --  Test for all states of finite state machine

   CLK <= '0';   
   cycle_num <= 0;           
   wait for delay_wr_in;
   IP <= "0000";
   RST <= '1';
   test_state <= S0;

   wait for delay_pos_edge;
   CLK <= '1';
   wait for delay_wr_out;
   wait for delay_neg_edge; -- S0

   CLK <= '0';   
   cycle_num <= 1;           
   wait for delay_wr_in;
   RST <= '0';

   wait for delay_pos_edge;
   test_state <= S1;
   CLK <= '1';
   wait for delay_wr_out;
   wait for delay_neg_edge; -- S1

   CLK <= '0';   
   cycle_num <= 2;           
   wait for delay_wr_in;
   IP <= "1101";
   RST <= '0';

   wait for delay_pos_edge;
   test_state <= S2;
   CLK <= '1';
   wait for delay_wr_out;
   wait for delay_neg_edge; -- S2

   CLK <= '0';   
   cycle_num <= 3;           
   wait for delay_wr_in;
   IP <= "0001";
   RST <= '0';

   wait for delay_pos_edge;
   test_state <= S4;
   CLK <= '1';
   wait for delay_wr_out;
   wait for delay_neg_edge; -- S4

   CLK <= '0';   
   cycle_num <= 4;           
   wait for delay_wr_in;
   IP <= "1001";
   RST <= '0';

   wait for delay_pos_edge;
   test_state <= S2;
   CLK <= '1';
   wait for delay_wr_out;
   wait for delay_neg_edge; -- S2

   CLK <= '0';   
   cycle_num <= 5;           
   wait for delay_wr_in;
   IP <= "1111";
   RST <= '0';

   wait for delay_pos_edge;
   test_state <= S3;
   CLK <= '1';
   wait for delay_wr_out;
   wait for delay_neg_edge; -- S3


 -- Test length 6
  wait;      -- stop simulation
 end process; -- STIMULI;

 WRITE_RESULTS(IP,RST,CLK,OP);

end architecture Task_1_arch_tb1;

configuration Task_1_cfg_tb1 of Task_1_ent_tb1 is
   for Task_1_arch_tb1
      for UUT : Task1  use entity work.Task1(Beh_arch);
      end for;
   end for;
end Task_1_cfg_tb1;
