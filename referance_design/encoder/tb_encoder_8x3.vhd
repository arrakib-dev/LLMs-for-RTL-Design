library ieee;
use ieee.std_logic_1164.all;

entity tb_encoder_8x3 is
  
end tb_encoder_8x3;
 architecture beh of tb_encoder_8x3 is
   component encoder_8x3
       port (
    d: in  std_logic_vector(7 downto 0);   -- inputs
    o: out std_logic_vector(2 downto 0));  -- outputs

end component;
    signal i_s : std_logic_vector(7 downto 0);  -- signals
    signal o_s : std_logic_vector(2 downto 0);  -- output signals
 begin  -- beh

u1 : encoder_8x3 port map (
  d => i_s,
  o => o_s);

tst_p: process
   begin
       i_s<="00000001";
       wait for 100 ns;
       i_s<="00000010";
       wait for 100 ns;
       i_s<="00000100";
       wait for 100 ns;
       i_s<="00001000";
       wait for 100 ns;
       i_s<="00010000";
       wait for 100 ns;
       i_s<="00100000";
       wait for 100 ns;
       i_s<="01000000";
       wait for 100 ns;
       i_s<="10000000";
       wait for 100 ns;
    end process;
 end beh;