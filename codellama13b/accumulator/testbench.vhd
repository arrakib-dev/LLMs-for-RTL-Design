library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end entity;

architecture testbench of testbench is
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal Din : std_logic_vector(3 downto 0);
   signal Q : std_logic_vector(3 downto 0);
begin
   uut : entity work.accumulator_4bit
       port map (
           clk => clk,
           reset => reset,
           Din => Din,
           Q => Q
       );

   -- Clock process
   clk_proc : process
   begin
       clk <= '0';
       wait for 10 ns;
       clk <= '1';
       wait for 10 ns;
   end process;

--    Reset process
--    reset_proc : process
--    begin
--        reset <= '0';
--        wait for 10 ns;
--        reset <= '1';
--        wait for 10 ns;
--    end process;

   -- Stimuli process
   stimuli_proc : process
   begin
       -- Test 1: Reset
       reset <= '1';
       wait for 10 ns;
       reset <= '0';
       wait for 10 ns;

       -- Test 2: Input = 0
       Din <= "0000";
       wait for 10 ns;

       -- Test 3: Input = 1
       Din <= "0001";
       wait for 10 ns;

       -- Test 4: Input = 2
       Din <= "0010";
       wait for 10 ns;

       -- Test 5: Input = 3
       Din <= "0011";
       wait for 10 ns;

       -- Test 6: Input = 4
       Din <= "0100";
       wait for 10 ns;

       -- Test 7: Input = 5
       Din <= "0101";
       wait for 10 ns;

       -- Test 8: Input = 6
       Din <= "0110";
       wait for 10 ns;

       -- Test 9: Input = 7
       Din <= "0111";
       wait for 10 ns;

       -- Test 10: Input = 8
       Din <= "1000";
       wait for 10 ns;

       -- Test 11: Input = 9
       Din <= "1001";
       wait for 10 ns;

       -- Test 12: Input = 10
       Din <= "1010";
       wait for 10 ns;

       -- Test 13: Input = 11
       Din <= "1011";
       wait for 10 ns;

       -- Test 14: Input = 12
       Din <= "1100";
       wait for 10 ns;

       -- Test 15: Input = 13
       Din <= "1101";
       wait for 10 ns;

       -- Test 16: Input = 14
       Din <= "1110";
       wait for 10 ns;

       -- Test 17: Input = 15
       Din <= "1111";
       wait for 10 ns;
   end process;
end architecture;