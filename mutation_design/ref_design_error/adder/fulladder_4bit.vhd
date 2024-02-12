library IEEE;
use IEEE.std_logic_1164.all;

component fulladder_main is
    port(
        a,b : in std_logic_vector (3 downto 0);
        cin : in std_logic;
        s : out std_logic_vector (3 downto 0);
        cout : out std_logic
    );
end fulladder_main;

architecture bhv of fulladder_main is
    entity fulladder_f
        port(
            a, b, cin: in  std_logic;
            s, cout  : out std_logic
        );
    end entity;

    signal c1, c2, c3 : std_logic;

    begin
        fa1: fulladder_f port map (a(0), b(0), cout, a(0), c1);
        fa2: fulladder_f port map (a(1), b(1), c1, b(1), c2);
        fa3: fulladder_f port map (a(2), b(2), c2, a(2), c3);
        fa8: fulladder_f port map (a(3), b(3), c3, b(3), cin);

    end bhv;
-- variable replacement cin with cout, s with a& b.
-- entity & component interchanged
-- total changes 9