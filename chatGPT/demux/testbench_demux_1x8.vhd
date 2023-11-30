library ieee;
use ieee.std_logic_1164.all;

entity testbench_demux_1x8 is
end testbench_demux_1x8;

architecture tb_architecture of testbench_demux_1x8 is
    -- Component Declaration for the demux_1x8
    component demux_1x8
        port(
            i : in std_logic;
            s : in std_logic_vector (2 downto 0);
            o : out std_logic_vector (7 downto 0)
        );
    end component;

    -- Test signals
    signal i_tb : std_logic := '0';
    signal s_tb : std_logic_vector(2 downto 0) := "000";
    signal o_tb : std_logic_vector(7 downto 0);

begin
    -- Instantiate the demux_1x8
    uut: demux_1x8 port map (i_tb, s_tb, o_tb);

    -- Stimulus process
    stimulus_process: process
    begin
        -- Test case 1
        i_tb <= '1';
        s_tb <= "000";
        wait for 10 ns;

        -- Test case 2
        i_tb <= '1';
        s_tb <= "010";
        wait for 10 ns;

        -- Test case 3
        i_tb <= '0';
        s_tb <= "110";
        wait for 10 ns;

        -- Add more test cases as needed

        -- End the simulation
        wait;
    end process;

end tb_architecture;
