library ieee;
use ieee.std_logic_1164.all;

entity testbench_decoder_3x8 is
end testbench_decoder_3x8;

architecture tb_architecture of testbench_decoder_3x8 is
    -- Import the entity
    signal a_tb: std_logic_vector(2 downto 0);
    signal d_tb: std_logic_vector(7 downto 0);

    -- Instantiate the decoder_3x8 entity
    component decoder_3x8
        port(
            a: in std_logic_vector (2 downto 0);
            d: out std_logic_vector(7 downto 0)
        );
    end component;

begin
    -- Connecting signals
    decoder_instance: decoder_3x8 port map(a_tb, d_tb);

    -- Test cases
    process
    begin
        -- Test case 1
        a_tb <= "000";
        wait for 10 ns;
        
        -- Test case 2
        a_tb <= "101";
        wait for 10 ns;

        -- Add more test cases as needed

        wait;
    end process;
end tb_architecture;
