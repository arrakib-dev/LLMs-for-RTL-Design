-- library IEEE;
-- use IEEE.std_logic_1164.all;

-- entity encoder_8x3 is
--     port(
--         d: in std_logic_vector(7 downto 0);
--         o : out std_logic_vector(2 downto 0)
--     );
-- end encoder_8x3;

-- architecture encoder of encoder_8x3 is
--     begin
--         process (d)
--         begin 
--             o(0) <= d(4) or d(5) or d(6) or d(7);
--             o(1) <= d(2) or d(3) or d(6) or d(7);
--             o(2) <= d(1) or d(3) or d(5) or d(7);
--         end process;
--     end encoder;


    library ieee;
    use ieee.std_logic_1164.all;
    
    
    entity encoder_8x3 is
      
      port (
        d : in  std_logic_vector(7 downto 0);  -- inputs
        o : out std_logic_vector(2 downto 0));  -- outputs
    
    end encoder_8x3;
    
    
    architecture beh of encoder_8x3 is
    
    begin  -- beh
    
      enco : process (d)
      variable temp : std_logic_vector(2 downto 0);
      begin
      o <="111" when d(7)='1' else
            "110" when d(6)='1' else
            "101" when d(5)='1' else
            "100" when d(4)='1' else
            "011" when d(3)='1' else
            "010" when d(2)='1' else
            "001" when d(1)='1' else
            "000" ;

      end process enco;
    
    end beh;