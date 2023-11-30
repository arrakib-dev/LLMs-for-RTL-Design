library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_fulladder_4bit is
end entity tb_fulladder_4bit;

architecture tb of tb_fulladder_4bit is
    signal a, b, s: std_logic_vector(3 downto 0);
    signal cin, cout: std_logic;
    
begin
    uut: entity work.fulladder_4bit
        port map (
            a => a,
            b => b,
            cin => cin,
            s => s,
            cout => cout
        );
    -- Stimulus process
    stimulus_process: process
    begin
        for i in 0 to 15 loop  -- Iterate through all possible 4-bit numbers (0 to 15)
            for j in 0 to 15 loop
                for k in std_logic range '0' to '1' loop  -- Iterate through possible carry-in values (0 and 1)
                    -- Assign inputs using std_logic_unsigned.to_unsigned function
                    a <= std_logic_vector(to_unsigned(i, 4));
                    b <= std_logic_vector(to_unsigned(j, 4));
                    cin <= k;
                    
                    wait for 10 ns;  -- Wait for a few simulation cycles
                    
                    
                end loop;
            end loop;
        end loop;
        
        wait;
    end process stimulus_process;
end architecture tb;