library ieee;
use ieee.std_logic_1164.all;

entity decoder_3x8_tb is
end decoder_3x8_tb;

architecture tb of decoder_3x8_tb is

   signal a: std_logic_vector(2 downto 0);
   signal d: std_logic_vector(7 downto 0);

begin

   -- Instantiate the decoder
   DUT: entity work.decoder_3x8 port map(
      a => a,
      d => d
   );

   process begin

   -- Test inputs and outputs
   a <= "000"; wait for 10 ns;
   assert d = "00000001";
   a <= "001"; wait for 10 ns;
   assert d = "00000010";
   a <= "010"; wait for 10 ns;
   assert d = "00000100";
   a <= "011"; wait for 10 ns;
   assert d = "00001000";
   a <= "100"; wait for 10 ns;
   assert d = "00010000";
   a <= "101"; wait for 10 ns;
   assert d = "00100000";
   a <= "110"; wait for 10 ns;
   assert d = "01000000";
   a <= "111"; wait for 10 ns;
   assert d = "10000000";

   -- Test invalid input
   a <= "101"; wait for 10 ns;
   assert d = "00000000";

   end process;

end tb;
-- library ieee;
-- use ieee.std_logic_1164.all;

-- entity decoder_3x8_tb is
-- end decoder_3x8_tb;

-- architecture tb of decoder_3x8_tb is

--    constant clk_period : time := 10 ns;

--    signal a : std_logic_vector(2 downto 0);
--    signal d : std_logic_vector(7 downto 0);

--    component decoder_3x8 is
--       port(
--          a : in std_logic_vector(2 downto 0);
--          d : out std_logic_vector(7 downto 0)
--       );
--    end component;

-- begin

--    -- Instantiate the decoder
--    decoder: decoder_3x8 port map(a, d);

--    -- Generate a clock signal
-- --    clk : std_logic <= '0';
-- --    process begin
-- --       loop
-- --          wait for clk_period/2;
-- --          clk <= not clk;
-- --       end loop;
-- --    end process;
--   process begin
--    -- Initialize the input signal
--    a <= "000";
-- wait for 10 ns;
--    -- Test the decoder
--    assert d = "00000001" report "a = 000, d should be 00000001" severity failure;

--    -- Advance the input signal
--    a <= "001";
--    wait for 10 ns;
--    -- Test the decoder
--    assert d = "00000010" report "a = 001, d should be 00000010" severity failure; 

--    -- Advance the input signal
--    a <= "010";
--    wait for 10 ns;
--    -- Test the decoder
--    assert d = "00000100" report "a = 010, d should be 00000100" severity failure; 

--    -- Advance the input signal
--    a <= "011";
--    wait for 10 ns;
--    -- Test the decoder
--    assert d = "00001000" report "a = 011, d should be 00001000" severity failure; 

--    -- Advance the input signal
--    a <= "100";
--    wait for 10 ns;
--    -- Test the decoder
--    assert d = "00010000" report "a = 100, d should be 00010000" severity failure; 

--    -- Advance the input signal
--    a <= "101";
--    wait for 10 ns;
--    -- Test the decoder
--    assert d = "00100000" report "a = 101, d should be 00100000" severity failure; 

--    -- Advance the input signal
--    a <= "110";
--    wait for 10 ns;
--    -- Test the decoder
--    assert d = "01000000" report "a = 110, d should be 01000000" severity failure; 

--    -- Advance the input signal
--    a <= "111";
--    wait for 10 ns;
--    -- Test the decoder
--    assert d = "10000000" report "a = 111, d should be 10000000" severity failure; 

--   end process;
-- end tb;