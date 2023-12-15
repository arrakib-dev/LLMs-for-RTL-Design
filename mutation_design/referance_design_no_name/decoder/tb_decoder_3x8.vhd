library ieee;
use ieee.std_logic_1164.all;

entity tb_decoder_3x8 is

end tb_decoder_3x8;
 architecture beh of tb_decoder_3x8 is
   component decoder_3x8
       port (
    a: in  std_logic_vector(2 downto 0);   -- inputs
    d: out std_logic_vector(7 downto 0));  -- outputs

end component;
    signal ip_s : std_logic_vector(2 downto 0);  -- signals
    signal op_s : std_logic_vector(7 downto 0);  -- output signals
 begin  -- beh

u1 : decoder_3x8 port map (
  a => ip_s,
  d => op_s);

tst_p: process
   begin
      ip_s<="000";
       wait for 100 ns;
       ip_s<="001";
       wait for 100 ns;
       ip_s<="010";
       wait for 100 ns;
       ip_s<="011";
       wait for 100 ns;
       ip_s<="100";
       wait for 100 ns;
       ip_s<="101";
       wait for 100 ns;
       ip_s<="110";
       wait for 100 ns;
       ip_s<="111";
       wait for 100 ns;
    end process;
 end beh;