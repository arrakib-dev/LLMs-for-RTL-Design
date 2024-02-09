library ieee;
use ieee.std_logic_1164.all;

entity mux_8x1_tb is
end entity;

architecture testbench of mux_8x1_tb is
   signal d : std_logic_vector(7 downto 0);
   signal s : std_logic_vector(2 downto 0);
   signal o : std_logic;
begin
   uut: entity work.mux_8x1
       port map (
           d => d,
           s => s,
           o => o
       );

   process
   begin
       -- Test case 1: s = "000"
       s <= "000";
       wait for 1 ns;
       assert o = d(0) report "Output is not equal to input" severity error;

       -- Test case 2: s = "001"
       s <= "001";
       wait for 1 ns;
       assert o = d(1) report "Output is not equal to input" severity error;

       -- Test case 3: s = "010"
       s <= "010";
       wait for 1 ns;
       assert o = d(2) report "Output is not equal to input" severity error;

       -- Test case 4: s = "011"
       s <= "011";
       wait for 1 ns;
       assert o = d(3) report "Output is not equal to input" severity error;

       -- Test case 5: s = "100"
       s <= "100";
       wait for 1 ns;
       assert o = d(4) report "Output is not equal to input" severity error;

       -- Test case 6: s = "101"
       s <= "101";
       wait for 1 ns;
       assert o = d(5) report "Output is not equal to input" severity error;

       -- Test case 7: s = "110"
       s <= "110";
       wait for 1 ns;
       assert o = d(6) report "Output is not equal to input" severity error;

       -- Test case 8: s = "111"
       s <= "111";
       wait for 1 ns;
       assert o = d(7) report "Output is not equal to input" severity error;
   end process;
end architecture;