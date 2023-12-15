-- library ieee;
-- use ieee.std_logic_1164.all;

-- entity demux_1x8_tb is
-- end demux_1x8_tb;

-- architecture behavioral of demux_1x8_tb is

--     -- Instantiate the DEMUX component
--     signal i : std_logic;
--     signal s : std_logic_vector(2 downto 0);
--     signal o : std_logic_vector(7 downto 0);

--     -- Test data for input/select signal combinations
--     signal input_values : std_logic_vector(7 downto 0) := (others => '0');
--     signal select_values : std_logic_vector(2 downto 0) := (others => '0');

-- begin

--     -- Connect the DUT ports to the testbench signals
--     dut : entity work.demux_1x8 port map(i => i, s => s, o => o);

--     -- Process for applying test stimuli
--     process
--     begin
--         -- Apply input value 0 and select value 000
--         input_values <= '0';
--         select_values <= '000';
--         i <= input_values(0);
--         s <= select_values;
--         wait for 10ns;

--         -- Apply input value 1 and select value 001
--         input_values <= '1';
--         select_values <= '001';
--         i <= input_values(0);
--         s <= select_values;
--         wait for 10ns;

--         ...

--          -- Apply input value 7 and select value 111
--         input_values <= '1';
--         select_values <= '111';
--         i <= input_values(0);
--         s <= select_values;
--         wait for 10ns;
--     end process;

-- end behavioral;
library ieee;
use ieee.std_logic_1164.all;

entity demux_1x8_tb is
end demux_1x8_tb;

architecture behavioral of demux_1x8_tb is

   component demux_1x8 is
       port(
           i : in std_logic;
           s : in std_logic_vector (2 downto 0);
           o : out std_logic_vector (7 downto 0)
       );
   end component;

   signal i : std_logic;
   signal s : std_logic_vector (2 downto 0);
   signal o : std_logic_vector (7 downto 0);

begin

   DUT: demux_1x8 port map (
       i => i,
       s => s,
       o => o
   );

   process begin
   -- Test cases
   i <= '0';
   s <= "000";
   wait for 1 ns;
   assert o = "00000000";

   i <= '1';
   s <= "001";
   wait for 1 ns;
   assert o = "00000001";

   i <= '0';
   s <= "010";
   wait for 1 ns;
   assert o = "00000010";

   i <= '1';
   s <= "011";
   wait for 1 ns;
   assert o = "00000011";

   i <= '0';
   s <= "100";
   wait for 1 ns;
   assert o = "00000100";

   i <= '1';
   s <= "101";
   wait for 1 ns;
   assert o = "00000101";

   i <= '0';
   s <= "110";
   wait for 1 ns;
   assert o = "00000110";

   i <= '1';
   s <= "111";
   wait for 1 ns;
   assert o = "00000111";

   wait;
   end process;

end behavioral;