library ieee;
use ieee.std_logic_1164.all;

entity demux_1x8_tb is
end demux_1x8_tb;

architecture testbench of demux_1x8_tb is
   signal i : std_logic;
   signal s : std_logic_vector(2 downto 0);
   signal o : std_logic_vector(7 downto 0);
begin
   uut: entity work.demux_1x8
       port map (
           i => i,
           s => s,
           o => o
       );

   process
   begin
       i <= '0';
       s <= "000";
       wait for 10 ns;
       assert o = "00000000" report "Output not correct for 000" severity error; -- chabged

       i <= '1';
       s <= "001";
       wait for 10 ns;
       assert o = "00000010" report "Output not correct for 001" severity error; -- chabged

       i <= '0';
       s <= "010";
       wait for 10 ns;
       assert o = "00000000" report "Output not correct for 010" severity error; -- chabged

       i <= '1';
       s <= "011";
       wait for 10 ns;
       assert o = "00001000" report "Output not correct for 011" severity error; -- chabged

       i <= '0';
       s <= "100";
       wait for 10 ns;
       assert o = "00000000" report "Output not correct for 100" severity error; -- chabged

       i <= '1';
       s <= "101";
       wait for 10 ns;
       assert o = "00100000" report "Output not correct for 101" severity error; -- chabged

       i <= '0';
       s <= "110";
       wait for 10 ns;
       assert o = "00000000" report "Output not correct for 110" severity error; -- chabged

       i <= '1';
       s <= "111";
       wait for 10 ns;
       assert o = "10000000" report "Output not correct for 111" severity error; -- chabged
   end process;
end testbench;