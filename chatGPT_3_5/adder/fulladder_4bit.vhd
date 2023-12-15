library IEEE;
use IEEE.std_logic_1164.all;

entity fulladder_4bit is
    port(
        a,b : in std_logic_vector (3 downto 0);
        cin : in std_logic;
        s : out std_logic_vector (3 downto 0);
        cout : out std_logic
    );
end fulladder_4bit;

architecture withsignals of fulladder_4bit is
    component fulladder
        port(
            a, b, cin: in  std_logic;
            s, cout  : out std_logic
        );
    end component;

    signal c1, c2, c3 : std_logic;

    begin
        fa1: fulladder port map (a(0), b(0), cin, s(0), c1);
        fa2: fulladder port map (a(1), b(1), c1, s(1), c2);
        fa3: fulladder port map (a(2), b(2), c2, s(2), c3);
        fa8: fulladder port map (a(3), b(3), c3, s(3), cout);

    end withsignals;
