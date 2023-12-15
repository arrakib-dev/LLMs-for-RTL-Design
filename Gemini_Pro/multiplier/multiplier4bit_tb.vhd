library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier4bit_tb is
end multiplier4bit_tb;

architecture behavioral of multiplier4bit_tb is

-- DUT instantiation
component multiplier4bit is
    port ( A: in STD_LOGIC_VECTOR (3 downto 0);
           B: in STD_LOGIC_VECTOR (3 downto 0);
           S: out STD_LOGIC_VECTOR (7 downto 0));
end component;

-- DUT instance
signal A, B : STD_LOGIC_VECTOR (3 downto 0);
signal S : STD_LOGIC_VECTOR(7 downto 0);

begin

-- Connect DUT signals
dut: multiplier4bit port map(
    A => A,
    B => B,
    S => S
);

-- Test cases
process begin

    -- Test case 1: A = 0001, B = 0010
    A <= "0001";
    B <= "0010";
    wait for 10 ns;

    -- Verify expected output
    -- if S /= "0000" then
    --     report "Error: Expected output is '0000', but received '" & S & "'";
    --     wait;
    -- end if;

    -- Test case 2: A = 1010, B = 1101
    A <= "1010";
    B <= "1101";
    wait for 10 ns;

    -- Verify expected output
    -- if S /= "11110100" then
    --     report "Error: Expected output is '11110100', but received '" & S & "'";
    --     wait;
    -- end if;

end process;

end behavioral;
