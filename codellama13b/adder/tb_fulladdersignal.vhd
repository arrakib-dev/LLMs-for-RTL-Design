library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
-- Test Bench Entity
entity tb_fulladdersignal is
end tb_fulladdersignal;

architecture behavior of tb_fulladdersignal is
    component fulladder_4bit -- Component Declaration
        port(
            a,b : in std_logic_vector (3 downto 0);
            cin : in std_logic;
            s : out std_logic_vector (3 downto 0);
            cout : out std_logic
        );
      end component;

      signal a_tb, b_tb : std_logic_vector(3 downto 0) := "0000";
      signal cin_tb, cout_tb : std_logic := '0';
      signal s_tb : std_logic_vector(3 downto 0);
begin
      uut: fulladder_4bit port map(a => a_tb, b => b_tb, cin => cin_tb, s => s_tb, cout => cout_tb);

      stimulus: process
      begin
        wait for 5 ns;
          for i in 0 to 9 loop
              a_tb <= conv_std_logic_vector(i, 4);
                for j in 0 to 9 loop
                      b_tb <= conv_std_logic_vector(j, 4);
                    wait for 5 ns;
                end loop;
         end loop;
      end process stimulus;
end architecture behavior;