library ieee;
use ieee.std_logic_1164.all;

entity somedevice is
    port(
        d : in std_logic_vector (7 downto 0);
        s : in std_logic_vector (2 downto 0);
        o : out std_logic 
    );
end somedevice;

architecture bhv of somedevice is
    begin
        process(d, s)
        begin
            case s is
                when "000" => o <= d(0);
                when "001" => o <= d(1);
                when "010" => o <= d(2);                    
                when "011" => o <= d(3);
                when "100" => o <= d(4);
                when "101" => o <= d(5);
                when "110" => o <= d(6);
                when "111" => o <= d(7);
                when others => o <= d(0);    
            end case;
        end process;
    end bhv;
