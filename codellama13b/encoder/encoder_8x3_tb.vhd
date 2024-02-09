library ieee;
use ieee.std_logic_1164.all;

entity encoder_8x3_tb is
end entity;

architecture testbench of encoder_8x3_tb is
   signal d : std_logic_vector(7 downto 0);
   signal o : std_logic_vector(2 downto 0);
begin
   uut: entity work.encoder_8x3
       port map (
           d => d,
           o => o
       );

   process
   begin
       d <= "00000000";
       wait for 10 ns;
       assert o = "000" report "Error: expected o = 000, actual o = " & to_string(o) severity failure;

       d <= "00000001";
       wait for 10 ns;
       assert o = "000" report "Error: expected o = 000, actual o = " & to_string(o) severity failure; -- changed

       d <= "00000010";
       wait for 10 ns;
       assert o = "001" report "Error: expected o = 010, actual o = " & to_string(o) severity failure;

       d <= "00000011";
       wait for 10 ns;
       assert o = "001" report "Error: expected o = 011, actual o = " & to_string(o) severity failure;

       d <= "00000100";
       wait for 10 ns;
       assert o = "010" report "Error: expected o = 100, actual o = " & to_string(o) severity failure;

       d <= "00000101";
       wait for 10 ns;
       assert o = "010" report "Error: expected o = 101, actual o = " & to_string(o) severity failure;

       d <= "00000110";
       wait for 10 ns;
       assert o = "010" report "Error: expected o = 110, actual o = " & to_string(o) severity failure;

       d <= "00000111";
       wait for 10 ns;
       assert o = "010" report "Error: expected o = 111, actual o = " & to_string(o) severity failure;

       wait;
   end process;
end architecture;