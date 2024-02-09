LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 

entity binary_4bit_tb is
end entity;

architecture testbench of binary_4bit_tb is
 signal clk : std_logic;
 signal rst : std_logic;
 signal o : std_logic_vector(3 downto 0);
 constant clk_period : time := 10 ns; 
begin
 -- Instantiate the binary_4bit entity
 binary_4bit_inst : entity work.binary_4bit
   port map (
     clk => clk,
     rst => rst,
     o => o
   );

  clk_process :process begin clk <= '0'; wait for clk_period/2; clk <= '1'; wait for clk_period/2; end process; 

 -- Define the test process
 process
   begin
     -- Test the reset signal
     rst <= '1';
     wait for 10 ns;
     rst <= '0';
     wait for 100 ns;

     -- Test the clock signal
    --  clk <= '1';
    --  wait for 10 ns;
    --  clk <= '0';
    --  wait for 10 ns;

     -- Test the output
     assert o = x"0" report "Output is not 0000" severity error;
     wait for 10 ns;

     -- Test the reset signal again
     rst <= '1';
     wait for 10 ns;
     rst <= '0';
     wait for 100 ns;

     -- Test the clock signal again
    --  clk <= '1';
    --  wait for 10 ns;
    --  clk <= '0';
    --  wait for 10 ns;

     -- Test the output again
     assert o = x"0" report "Output is not 0000" severity error;
     wait for 10 ns;
   end process;
end architecture;