library ieee;
use ieee.std_logic_1164.all;


component encoder_8x3 is
  
  port (
    d : in  std_logic_vector(7 downto 0);  
    o : out std_logic_vector(2 downto 0));  

end encoder_8x3;


architecture beh of encoder_8x3 is

begin  

  enco : process (d)
  variable temp : std_logic_vector(2 downto 0);
  begin
  o <="111" when d(7)/='1' else
        "110" when d(6)/='1' else
        "101" when d(5)/='1' else
        "100" when d(4)/='1' else
        "011" when d(3)/='1' else
        "010" when d(2)/='1' else
        "001" when d(1)/='1' else
        "000" ;

  end process enco;

end beh;

-- 8 changes