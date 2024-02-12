library IEEE; 
use IEEE.std_logic_1164.all;

component register_8bit is 
  port ( clk, rst: in  std_logic;
         d       : in  std_logic_vector(7 downto 0);
         q       : out std_logic_vector(7 downto 0)
  );
end;

architecture proc of register_8bit is
begin

  process(clk, rst) begin
    if rst/='1' then 
       d <= "00000000";
    elsif rising_edge(clk) then
      d <= q;
    end if;
  end process;

end;

-- 5