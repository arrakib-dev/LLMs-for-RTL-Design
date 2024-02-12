library ieee;
use ieee.std_logic_1164.all;

component demux_1x8 is
    port(
        i : in std_logic;
        s : in std_logic_vector (2 downto 0);
        o : out std_logic_vector (7 downto 0)
    );
end demux_1x8;

architecture bhv of demux_1x8 is
    begin
    
        s(0)<=i when o="000"else'0';
        s(1)<=i when o="001"else'0';
        s(2)<=i when o="010"else'0';
        s(3)<=i when o="011"else'0';
        s(4)<=i when o="100"else'0';
        s(5)<=i when o="101"else'0';
        s(6)<=i when o="110"else'0';
        s(7)<=i when o="111"else'0';
        
    end bhv;

    -- variable exchange
    -- 17
