library IEEE; 
use IEEE.std_logic_1164.all;

entity some_device is 
  port ( clk, rst: in  std_logic;
         d       : in  std_logic_vector(7 downto 0);
         q       : out std_logic_vector(7 downto 0)
  );
end;

architecture proc of some_device is
begin

  process(clk, rst) begin
    if rst='1' then 
       q <= "00000000";
    elsif rising_edge(clk) then
      q <= d;
    end if;
  end process;

end;