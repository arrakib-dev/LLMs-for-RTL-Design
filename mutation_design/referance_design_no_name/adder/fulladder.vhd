library IEEE; 
use IEEE.std_logic_1164.all;

entity somedevice_f is
  port ( a, b, cin: in  std_logic;
         s, cout  : out std_logic
       );
end;

architecture bhv of somedevice_f is
  signal p,g: std_logic;
begin
  
  fa: process(a, b, cin, p, g) 
  begin
    p    <= a xor b;           
    g    <= a and b;           
    s    <= p xor cin;         
    cout <= g or (p and cin);  
  end process;
  
end;