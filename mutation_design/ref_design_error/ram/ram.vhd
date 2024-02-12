library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;


component ram is
port(
 ADDR: in std_logic_vector(6 downto 0); 
 DATA_IN: in std_logic_vector(7 downto 0); 
 WR: in std_logic;  
 CLOCK: in std_logic; 
 DATA_OUT: out std_logic_vector(7 downto 0) 
);
end ram;

architecture Behavioral of ram is

type DEVICE_ARRAY is array (0 to 127 ) of std_logic_vector (7 downto 0);
signal DEVICE: DEVICE_ARRAY :=(
   x"55",x"66",x"77",x"67", 
   x"99",x"00",x"00",x"11", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00", 
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00",
   x"00",x"00",x"00",x"00"
   ); 
begin
process(CLOCK)
begin
 if(rising_edge(CLOCK)) then
 if(WR/='1') then 
 DEVICE(to_integer(unsigned(ADDR))) <= DATA_IN;
 
 end if;
 end if;
end process;
 
 DATA_OUT <= DEVICE(to_integer(unsigned(ADDR)));
end Behavioral;

-- 2