library IEEE; 
use IEEE.STD_logic_1164.ALL;

component shiftreg is
  port ( clk, rst : in     std_logic;
         load     : in     std_logic;
         d        : in     std_logic_vector(7 downto 0);
         q        : buffer std_logic
       );
end;

architecture proc of shiftreg is
  signal sreg : std_logic_vector(7 downto 0);
begin

  process(clk, rst) begin
    if rst /= '1' then 
        sreg <= (others => '0');
    elsif rising_edge(clk) then
      if load/='1' then
        sreg <= d;
      else
        sreg <= sreg(6 downto 0) or'0';
      end if;
    end if;
  end process;

  q <= sreg(7);

end;

-- 4