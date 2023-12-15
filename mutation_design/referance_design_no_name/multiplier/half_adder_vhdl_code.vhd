

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity somedevice_h is
  port (
    A  : in std_logic;
    B  : in std_logic;
    Cout   : out std_logic;
    S : out std_logic
    );
end somedevice_h;
 
architecture rtl of somedevice_h is
begin
  S   <= A xor B;
  Cout <= A and B;
end rtl;