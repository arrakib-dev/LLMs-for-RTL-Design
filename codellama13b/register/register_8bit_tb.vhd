library ieee;
use ieee.std_logic_1164.all;

entity register_8bit_tb is
end entity;

architecture testbench of register_8bit_tb is
--  signal clk, rst, d : std_logic_vector(7 downto 0);
signal clk, rst: std_logic;
 signal d ,q : std_logic_vector(7 downto 0);
begin
 uut: entity work.register_8bit
   port map (
     clk => clk,
     rst => rst,
     d => d,
     q => q
   );

 clk <= '0' after 10 ns, '1' after 20 ns;
 rst <= '1' after 30 ns, '0' after 40 ns;
 d <= "00000001" after 50 ns, "00000010" after 60 ns;

 process
 begin
   wait for 10 ns;
   assert q = "00000001" report "Error: q is not equal to 00000001" severity error;
   wait for 10 ns;
   assert q = "00000010" report "Error: q is not equal to 00000010" severity error;
   wait for 10 ns;
   assert q = "00000000" report "Error: q is not equal to 00000000" severity error;
 end process;
end architecture;