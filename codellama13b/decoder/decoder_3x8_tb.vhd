library ieee;
use ieee.std_logic_1164.all;

entity decoder_3x8_tb is
end entity;

architecture testbench of decoder_3x8_tb is
   signal a : std_logic_vector(2 downto 0);
   signal d : std_logic_vector(7 downto 0);
begin
   decoder_3x8_inst : entity work.decoder_3x8
       port map (
           a => a,
           d => d
       );

   -- Stimulus process
   stim_proc : process
   begin
       -- Test case 1: a = "000"
       a <= "000";
       wait for 10 ns;
       assert d = "00000001" report "Test case 1 failed" severity error;

       -- Test case 2: a = "001"
       a <= "001";
       wait for 10 ns;
       assert d = "00000010" report "Test case 2 failed" severity error;

       -- Test case 3: a = "010"
       a <= "010";
       wait for 10 ns;
       assert d = "00000100" report "Test case 3 failed" severity error;

       -- Test case 4: a = "011"
       a <= "011";
       wait for 10 ns;
       assert d = "00001000" report "Test case 4 failed" severity error;

       -- Test case 5: a = "100"
       a <= "100";
       wait for 10 ns;
       assert d = "00010000" report "Test case 5 failed" severity error;

       -- Test case 6: a = "101"
       a <= "101";
       wait for 10 ns;
       assert d = "00100000" report "Test case 6 failed" severity error;

       -- Test case 7: a = "110"
       a <= "110";
       wait for 10 ns;
       assert d = "01000000" report "Test case 7 failed" severity error;

       -- Test case 8: a = "111"
       a <= "111";
       wait for 10 ns;
       assert d = "10000000" report "Test case 8 failed" severity error;
   end process;
end architecture;