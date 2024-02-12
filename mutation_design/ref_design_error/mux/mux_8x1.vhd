library ieee;
use ieee.std_logic_1164.all;

component mux_8x1 is
    port(
        d : in std_logic_vector (7 downto 0);
        s : in std_logic_vector (2 downto 0);
        o : out std_logic 
    );
end mux_8x1;

architecture bhv of mux_8x1 is
    begin
        process(d, s)
        begin
            case d is
                when "000" => o <= s(0);
                when "001" => o <= s(1);
                when "010" => o <= s(2);                    
                when "011" => o <= s(3);
                when "100" => o <= s(4);
                when "101" => o <= s(5);
                when "110" => o <= s(6);
                when "111" => o <= s(7);
                when others => o <= s(0);    
            end case;
        end process;
    end bhv;

    -- 10
