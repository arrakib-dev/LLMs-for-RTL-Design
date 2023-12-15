library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tb_binary_4bit is
end tb_binary_4bit;

architecture Behavioral of tb_binary_4bit is

signal rst,clk: std_logic;
signal o:std_logic_vector(3 downto 0);

begin
dut: entity work.binary_4bit port map (clk => clk, rst=>rst, o => o);
   -- Clock process definitions
clock_process :process
begin
     clk <= '0';
     wait for 10 ns;
     clk <= '1';
     wait for 10 ns;
end process;


-- Stimulus process
stim_proc: process
begin        
   -- hold reset state for 100 ns.
     rst <= '1';
   wait for 20 ns;    
    rst <= '0';
   wait;
end process;
end Behavioral;