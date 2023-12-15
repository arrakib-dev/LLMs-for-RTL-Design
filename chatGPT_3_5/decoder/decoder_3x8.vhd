library ieee;
use ieee.std_logic_1164.all;

entity decoder_3x8 is
    port(
        a: in std_logic_vector (2 downto 0);
        d: out std_logic_vector(7 downto 0)
    );
end decoder_3x8;

architecture decoder of decoder_3x8 is
    begin
        process (a)
        begin 
            case a is
                when "000" => d <= "00000001";
                when "001" => d <= "00000010";
                when "010" => d <= "00000100";
                when "011" => d <= "00001000";
                when "100" => d <= "00010000";
                when "101" => d <= "00100000";
                when "110" => d <= "01000000";
                when "111" => d <= "10000000";
                when others => d <= "00000000";
            end case;
        end process;
    end decoder;