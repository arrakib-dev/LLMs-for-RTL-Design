library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is
    -- port (
    --     -- clk : in std_logic;
    --     a, b : in std_logic_vector (3 downto 0);
    --     cin : in std_logic;
    --     s : inout std_logic_vector (3 downto 0);
    --     cout : inout std_logic
    -- );
end entity testbench;

architecture tb of testbench is
    signal c1, c2, c3 : std_logic;
    signal a, b :  std_logic_vector (3 downto 0);
    signal cin :  std_logic;
    signal s :  std_logic_vector (3 downto 0);
    signal cout :  std_logic;

begin
    -- Instantiate the full adder
    fulladder_4bit: entity work.fulladder_4bit port map (a, b, cin, s, cout);

    -- Clock process
    -- process
    -- begin
    --     clk <= '0';
    --     wait for 5 ns;
    --     clk <= '1';
    --     wait for 5 ns;
    -- end process;

    -- Test stimulus
    process
    begin
        -- Case 1: Add 0 and 0
        a <= (others => '0');
        b <= (others => '0');
        cin <= '0';
        wait for 20 ns;

        -- Case 2: Add 1 and 1
        a <= (others => '1');
        b <= (others => '1');
        cin <= '0';
        wait for 20 ns;

        -- Case 3: Add 1 and 0
        a <= (others => '1');
        b <= (others => '0');
        cin <= '0';
        wait for 20 ns;

        -- Case 4: Add 0 and 1
        a <= (others => '0');
        b <= (others => '1');
        cin <= '0';
        wait for 20 ns;

        -- Case 5: Add 2 and 3
        a <=  std_logic_vector(to_unsigned(2,4));
        b <= std_logic_vector(to_unsigned(3,4));
        cin <= '0';
        wait for 20 ns;

        -- Case 6: Add 3 and 2
        a <= std_logic_vector(to_unsigned(3,4));
        b <= std_logic_vector(to_unsigned(2,4));
        cin <= '0';
        wait for 20 ns;

    end process;
end architecture tb;

-- Origianl code--
-- library IEEE;
-- use IEEE.std_logic_1164.all;

-- entity testbench is
--     port (
--         clk : in std_logic;
--         a, b : in std_logic_vector (3 downto 0);
--         cin : in std_logic;
--         s : inout std_logic_vector (3 downto 0);
--         cout : inout std_logic
--     );
-- end entity testbench;

-- architecture tb of testbench is
--     signal c1, c2, c3 : std_logic;

-- begin
--     -- Instantiate the full adder
--     fulladder_4bit: fulladder_4bit port map (a, b, cin, s, cout);

--     -- Clock process
--     process
--     begin
--         clk <= '0';
--         wait for 5 ns;
--         clk <= '1';
--         wait for 5 ns;
--     end process;

--     -- Test stimulus
--     process
--     begin
--         -- Case 1: Add 0 and 0
--         a <= (others => '0');
--         b <= (others => '0');
--         cin <= '0';
--         wait for 20 ns;

--         -- Case 2: Add 1 and 1
--         a <= (others => '1');
--         b <= (others => '1');
--         cin <= '0';
--         wait for 20 ns;

--         -- Case 3: Add 1 and 0
--         a <= (others => '1');
--         b <= (others => '0');
--         cin <= '0';
--         wait for 20 ns;

--         -- Case 4: Add 0 and 1
--         a <= (others => '0');
--         b <= (others => '1');
--         cin <= '0';
--         wait for 20 ns;

--         -- Case 5: Add 2 and 3
--         a <= (others => '2');
--         b <= (others => '3');
--         cin <= '0';
--         wait for 20 ns;

--         -- Case 6: Add 3 and 2
--         a <= (others => '3');
--         b <= (others => '2');
--         cin <= '0';
--         wait for 20 ns;

--     end process;
-- end architecture tb;