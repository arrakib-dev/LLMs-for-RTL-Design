library ieee; use ieee.std_logic_1164.all; 

entity demux_1x8_tb is -- Test bench entity does not have ports.
 end demux_1x8_tb; 

architecture behavior of demux_1x8_tb is 

-- Component Declaration for the Unit Under Test (UUT) 
component demux_1x8 port( i : in std_logic; s : in std_logic_vector (2 downto 0); o : out std_logic_vector (7 downto 0) ); end component;
 --Inputs 
signal i : std_logic := '0'; signal s : std_logic_vector(2 downto 0) := (others => '0');
 --Outputs 
signal o : std_logic_vector(7 downto 0);
 -- Clock period definitions
 constant clk_period : time := 10 ns; begin
 -- Instantiate the Unit Under Test (UUT)
 uut: demux_1x8 port map ( i => i, s => s, o => o ); 
-- Stimulus process
 stim_proc: process begin 
-- Test case 1
 i <= '1'; s <= "000"; wait for clk_period; i <= '0'; s <= "001"; wait for clk_period;
  -- Test case 2
   i <= '1'; s <= "010"; wait for clk_period; i <= '0'; s <= "011"; wait for clk_period; 
   -- Test case 3 
   i <= '1'; s <= "100"; wait for clk_period; i <= '0'; s <= "101"; wait for clk_period; 
   -- Test case 4 
   i <= '1'; s <= "110"; wait for clk_period; i <= '0'; s <= "111"; wait for clk_period;
    -- Add more test cases as needed -- End simulation 
wait; end process; end behavior; 