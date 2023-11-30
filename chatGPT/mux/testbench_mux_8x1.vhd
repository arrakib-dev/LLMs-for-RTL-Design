library ieee;
use ieee.std_logic_1164.all;

entity testbench_mux_8x1 is
end testbench_mux_8x1;

architecture testbench of testbench_mux_8x1 is
    signal d_input : std_logic_vector(7 downto 0);
    signal s_input : std_logic_vector(2 downto 0);
    signal o_output : std_logic;

    -- Instantiate the mux_8x1 component
    component mux_8x1
        port(
            d : in std_logic_vector(7 downto 0);
            s : in std_logic_vector(2 downto 0);
            o : out std_logic
        );
    end component;

begin
    -- Instantiate the mux_8x1 component
    mux_instance : mux_8x1
        port map(
            d => d_input,
            s => s_input,
            o => o_output
        );

    -- Stimulus process
    stimulus_process: process
    begin
        -- Test case 1
        d_input <= "00000001";
        s_input <= "000";
        wait for 10 ns;

        -- Test case 2
        d_input <= "00000010";
        s_input <= "001";
        wait for 10 ns;

        -- Add more test cases as needed

        wait;
    end process stimulus_process;

end testbench;
