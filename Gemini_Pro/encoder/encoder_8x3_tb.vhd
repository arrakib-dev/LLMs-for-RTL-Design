-- library ieee;
-- use ieee.std_logic_1164.all;

-- entity encoder_8x3_tb is
-- end entity encoder_8x3_tb;

-- architecture beh of encoder_8x3_tb is

--   signal d: std_logic_vector(7 downto 0);
--   signal o: std_logic_vector(2 downto 0);

-- begin

--   -- Drive the input port with various values
--   -- d <= "00000001";
--   -- #10;
--   -- d <= "00000010";
--   -- #10;
--   -- d <= "00000011";
--   -- #10;
--   -- d <= "00000100";
--   -- #10;
--   -- d <= "00001000";
--   -- #10;
--   -- d <= "00010000";
--   -- #10;
--   -- d <= "00100000";
--   -- #10;
--   -- d <= "01000000";
--   -- #10;
--   -- d <= "10000000";
--   -- #10;

--   -- Instantiate the encoder circuit
--   ENC: entity work.encoder_8x3 port map(
--     d => d,
--     o => o
--   );

--   -- Monitor the output port
--   assert o = "111" when d = "00000001" else
--     assert o = "110" when d = "00000010" else
--     assert o = "101" when d = "00000011" else
--     assert o = "100" when d = "00000100" else
--     assert o = "011" when d = "00001000" else
--     assert o = "010" when d = "00010000" else
--     assert o = "001" when d = "00100000" else
--     assert o = "000" when d = "01000000" else
--     assert o = "000" when d = "10000000";

-- end beh;
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

    entity encoder_8x3_tb is
    end encoder_8x3_tb;

    architecture beh of encoder_8x3_tb is

        component encoder_8x3 is
            port (
                d : in  std_logic_vector(7 downto 0);  -- inputs
                o : out std_logic_vector(2 downto 0));  -- outputs
        end component;

        signal d : std_logic_vector(7 downto 0);
        signal o : std_logic_vector(2 downto 0);

        begin

            -- Instantiate the 8x3 encoder
            encoder_inst : encoder_8x3 port map (
                d => d,
                o => o
            );

            -- Test cases
            process
            begin
                d <= "00000000";
                wait for 20 ns;
                assert o = "000";

                d <= "00000001";
                wait for 20 ns;
                assert o = "001";

                d <= "00000010";
                wait for 20 ns;
                assert o = "010";

                d <= "00000011";
                wait for 20 ns;
                assert o = "011";

                d <= "00000100";
                wait for 20 ns;
                assert o = "100";

                d <= "00000101";
                wait for 20 ns;
                assert o = "101";

                d <= "00000110";
                wait for 20 ns;
                assert o = "110";

                d <= "00000111";
                wait for 20 ns;
                assert o = "111";

                -- $finish;
            end process;

        end beh;
