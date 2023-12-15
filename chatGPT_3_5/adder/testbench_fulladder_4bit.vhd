library IEEE;
use IEEE.std_logic_1164.all;

entity testbench_fulladder_4bit is
end testbench_fulladder_4bit;

architecture tb_architecture of testbench_fulladder_4bit is
    signal a, b: std_logic_vector(3 downto 0);
    signal cin: std_logic;
    signal s: std_logic_vector(3 downto 0);
    signal cout: std_logic;

    component fulladder_4bit
        port(
            a, b : in std_logic_vector(3 downto 0);
            cin  : in std_logic;
            s    : out std_logic_vector(3 downto 0);
            cout : out std_logic
        );
    end component;

begin
    -- Instantiate the 4-bit full adder
    uut: fulladder_4bit port map (a, b, cin, s, cout);

    -- Stimulus process
    stimulus_process: process
    begin
        -- Test case 1
        a <= "0000";
        b <= "0000";
        cin <= '0';
        wait for 10 ns;

        -- Test case 2
        a <= "0101";
        b <= "1010";
        cin <= '0';
        wait for 10 ns;

        -- Test case 3
        a <= "1111";
        b <= "0001";
        cin <= '1';
        wait for 10 ns;

        -- Add more test cases as needed

        wait;
    end process stimulus_process;

end tb_architecture;
