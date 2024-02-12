library ieee;
use ieee.std_logic_1164.all;

entity shift_reg_tb is
end entity;

architecture testbench of shift_reg_tb is
 signal clk, rst, load : std_logic;
 signal d : std_logic_vector(7 downto 0);
 signal q : std_logic;

begin

 -- Instantiate the shift register
 uut : entity work.shiftreg  
   port map (
     clk => clk,
     rst => rst,
     load => load,
     d => d,
     q => q
   ); -- changed

 -- Clock process
 clk_proc : process
 begin
   clk <= '0';
   wait for 10 ns;
   clk <= '1';
   wait for 10 ns;
 end process;

 -- Reset process
 rst_proc : process
 begin
   rst <= '1';
   wait for 10 ns;
   rst <= '0';
   wait for 10 ns;
 end process;

 -- Load process
 load_proc : process
 begin
   load <= '1';
   wait for 10 ns;
   load <= '0';
   wait for 10 ns;
 end process;

 -- Data process
 data_proc : process
 begin
   d <= "00000001";
   wait for 10 ns;
   d <= "00000010";
   wait for 10 ns;
   d <= "00000100";
   wait for 10 ns;
   d <= "00001000";
   wait for 10 ns;
   d <= "00010000";
   wait for 10 ns;
   d <= "00100000";
   wait for 10 ns;
   d <= "01000000";
   wait for 10 ns;
   d <= "10000000";
   wait for 10 ns;
 end process;

 -- Check output
 check_proc : process
 begin
   wait for 10 ns;
  --  assert q = "00000001" report "Error: q is not equal to 00000001" severity error;
  --  wait for 10 ns;
  --  assert q = "00000010" report "Error: q is not equal to 00000010" severity error;
  --  wait for 10 ns;
  --  assert q = "00000100" report "Error: q is not equal to 00000100" severity error;
  --  wait for 10 ns;
  --  assert q = "00001000" report "Error: q is not equal to 00001000" severity error;
  --  wait for 10 ns;
  --  assert q = "00010000" report "Error: q is not equal to 00010000" severity error;
  --  wait for 10 ns;
  --  assert q = "00100000" report "Error: q is not equal to 00100000" severity error;
  --  wait for 10 ns;
  --  assert q = "01000000" report "Error: q is not equal to 01000000" severity error;
  --  wait for 10 ns;
  --  assert q = "10000000" report "Error: q is not equal to 10000000" severity error;
 end process;

end architecture;