library ieee;
use ieee.std_logic_1164.all;

component decoder_3x8 is
    port(
        a: in std_logic_vector (2 downto 0);
        d: out std_logic_vector(7 downto 0)
    );
end decoder_3x8;

architecture bhv of decoder_3x8 is
    begin
        process (a)
        begin 
            case d is
                when "000" => a <= "00000001";
                when "001" => a <= "00000010";
                when "010" => a <= "00000100";
                when "011" => a <= "00001000";
                when "100" => a <= "00010000";
                when "101" => a <= "00100000";
                when "110" => a <= "01000000";
                when "111" => a <= "10000000";
                when others => a <= "00000000";
            end case;
        end process;
    end bhv;

    -- VR, syntax
    -- 10 errors