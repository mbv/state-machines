-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : 
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : C:\POCP\lab5\lab5\src\Task3_TB\Task3_tb2.vhd
-- Generated   : 10/22/17 20:57:13
-- From        : C:\POCP\lab5\lab5\src\Task3.asf
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

entity Task3_ent_tb2 is
end entity Task3_ent_tb2;

architecture Task3_arch_tb2 of Task3_ent_tb2 is
  constant delay_wr_in : Time := 5 ns;
  constant delay_pos_edge : Time := 5 ns;
  constant delay_wr_out : Time := 5 ns;
  constant delay_neg_edge : Time := 5 ns;

  file RESULTS : Text open WRITE_MODE is "results.txt";

  procedure WRITE_RESULTS(
    constant  IP : in Std_logic_Vector (3 downto 0);
    constant  CLK : in Std_logic;
    constant  RST : in Std_logic;
    constant  OP : in Std_logic_Vector (1 downto 0)
 ) is
     variable l_out : Line;
  begin
     WRITE(l_out, now, right, 15, ps);
     -- write input signals
     WRITE(l_out, IP, right, 11);
     WRITE(l_out, CLK, right, 8);
     WRITE(l_out, RST, right, 8);
     -- write output signals
     WRITE(l_out, OP, right, 9);
     WRITELINE(RESULTS, l_out);
  end;

  component Task3 is
    port(
      IP : in Std_logic_Vector (3 downto 0);
      CLK : in Std_logic;
      RST : in Std_logic;
      OP :out Std_logic_Vector (1 downto 0));
  end component; -- Task3;

 signal IP : Std_logic_Vector (3 downto 0);
 signal CLK : Std_logic;
 signal RST : Std_logic;
 signal OP : Std_logic_Vector (1 downto 0);

 signal cycle_num : Integer; -- takt number

-- this signal is added for compare test simulation results only
type test_Sreg0_type is (S0, S1, S2, S3, S4, any_state);
signal  test_Sreg0 : test_Sreg0_type;


begin
   UUT : Task3
   port map(
    IP => IP,
    CLK => CLK,
    RST => RST,
    OP => OP);

 STIMULI : process
 begin
 --  Test for all transition of finite state machine

   CLK <= '0';   
   cycle_num <= 0;           
   wait for delay_wr_in;
   IP <= "0000";
   RST <= '1';
   test_Sreg0 <= S0;

   wait for delay_pos_edge;
   CLK <= '1';
   wait for delay_wr_out;
   wait for delay_neg_edge; -- S0

   CLK <= '0';   
   cycle_num <= 1;           
   wait for delay_wr_in;
   IP <= "0000";
   RST <= '0';

   wait for delay_pos_edge;
   test_Sreg0 <= S0;
   CLK <= '1';
   wait for delay_wr_out;
   wait for delay_neg_edge; -- S0

   CLK <= '0';   
   cycle_num <= 2;           
   wait for delay_wr_in;
   IP <= "0011";
   RST <= '0';

   wait for delay_pos_edge;
   test_Sreg0 <= S1;
   CLK <= '1';
   wait for delay_wr_out;
   wait for delay_neg_edge; -- S1

   CLK <= '0';   
   cycle_num <= 3;           
   wait for delay_wr_in;
   IP <= "0000";
   RST <= '0';

   wait for delay_pos_edge;
   test_Sreg0 <= S1;
   CLK <= '1';
   wait for delay_wr_out;
   wait for delay_neg_edge; -- S1

   CLK <= '0';   
   cycle_num <= 4;           
   wait for delay_wr_in;
   IP <= "1111";
   RST <= '0';

   wait for delay_pos_edge;
   test_Sreg0 <= S4;
   CLK <= '1';
   wait for delay_wr_out;
   wait for delay_neg_edge; -- S4

   CLK <= '0';   
   cycle_num <= 5;           
   wait for delay_wr_in;
   IP <= "0000";
   RST <= '0';

   wait for delay_pos_edge;
   test_Sreg0 <= S4;
   CLK <= '1';
   wait for delay_wr_out;
   wait for delay_neg_edge; -- S4

   CLK <= '0';   
   cycle_num <= 6;           
   wait for delay_wr_in;
   IP <= "1101";
   RST <= '0';

   wait for delay_pos_edge;
   test_Sreg0 <= S3;
   CLK <= '1';
   wait for delay_wr_out;
   wait for delay_neg_edge; -- S3

   CLK <= '0';   
   cycle_num <= 7;           
   wait for delay_wr_in;
   IP <= "0001";
   RST <= '0';

   wait for delay_pos_edge;
   test_Sreg0 <= S3;
   CLK <= '1';
   wait for delay_wr_out;
   wait for delay_neg_edge; -- S3

   CLK <= '0';   
   cycle_num <= 8;           
   wait for delay_wr_in;
   IP <= "0000";
   RST <= '0';

   wait for delay_pos_edge;
   test_Sreg0 <= S2;
   CLK <= '1';
   wait for delay_wr_out;
   wait for delay_neg_edge; -- S2

   CLK <= '0';   
   cycle_num <= 9;           
   wait for delay_wr_in;
   IP <= "0000";
   RST <= '0';

   wait for delay_pos_edge;
   test_Sreg0 <= S2;
   CLK <= '1';
   wait for delay_wr_out;
   wait for delay_neg_edge; -- S2

   CLK <= '0';   
   cycle_num <= 10;          
   wait for delay_wr_in;
   IP <= "1100";
   RST <= '0';

   wait for delay_pos_edge;
   test_Sreg0 <= S1;
   CLK <= '1';
   wait for delay_wr_out;
   wait for delay_neg_edge; -- S1


 -- Test length 11
  wait;      -- stop simulation
 end process; -- STIMULI;

 WRITE_RESULTS(IP,CLK,RST,OP);

end architecture Task3_arch_tb2;

configuration Task3_cfg_tb2 of Task3_ent_tb2 is
   for Task3_arch_tb2
      for UUT : Task3  use entity work.Task3(Beh);
      end for;
   end for;
end Task3_cfg_tb2;
