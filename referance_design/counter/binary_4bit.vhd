library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity binary_4bit is
    Port ( clk: in std_logic; -- clock input
           rst: in std_logic; -- reset input 
           o: out std_logic_vector(3 downto 0) -- output 4-bit counter
     );
end binary_4bit;

architecture Behavioral of binary_4bit is
  signal counter_up: std_logic_vector(3 downto 0);
  begin
-- up counter
  process(clk)
    begin
      if(rising_edge(clk)) then
          if(rst='1') then
              counter_up <= x"0";
          else
              counter_up <= counter_up + x"1";
          end if;
      end if;
  end process;
  o <= counter_up;
end Behavioral;
