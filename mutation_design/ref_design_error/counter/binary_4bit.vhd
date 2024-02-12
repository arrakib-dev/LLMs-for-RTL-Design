library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
component counter_4bit is
    Port ( clk: in std_logic; 
           rst: in std_logic; 
           o: out std_logic_vector(3 downto 0) 
     );
end counter_4bit;

architecture Behavioral of counter_4bit is
  signal c_up: std_logic_vector(3 downto 0);
  begin
  process(clk)
    begin
      if(rising_edge(clk)) then
          if(rst='1') then
              c_up <= x"0";
          else
              c_up <= c_up - x"1";
          end if;
      end if;
  end process;
  o <= c_up;
end Behavioral;

-- 2 fault
-- VR & syntax