
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end entity;

architecture testbench of testbench is
   component multiplier4bit is
       port (
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (7 downto 0)
       );
   end component;

   signal A : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
   signal B : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
   signal S : STD_LOGIC_VECTOR (7 downto 0);

begin
   uut : multiplier4bit port map (
       A => A,
       B => B,
       S => S
   );

   process
   begin
       A <= "0000";
       B <= "0000";
       wait for 10 ns;
       assert S = "00000000" report "Incorrect result" severity error;

       A <= "0001";
       B <= "0001";
       wait for 10 ns;
       assert S = "00000001" report "Incorrect result" severity error;

       A <= "0010";
       B <= "0010";
       wait for 10 ns;
       assert S = "00000010" report "Incorrect result" severity error;

       A <= "0011";
       B <= "0011";
       wait for 10 ns;
       assert S = "00000011" report "Incorrect result" severity error;

       A <= "0100";
       B <= "0100";
       wait for 10 ns;
       assert S = "00000100" report "Incorrect result" severity error;

       A <= "0101";
       B <= "0101";
       wait for 10 ns;
       assert S = "00000101" report "Incorrect result" severity error;

       A <= "0110";
       B <= "0110";
       wait for 10 ns;
       assert S = "00000110" report "Incorrect result" severity error;

       A <= "0111";
       B <= "0111";
       wait for 10 ns;
       assert S = "00000111" report "Incorrect result" severity error;

       A <= "1000";
       B <= "1000";
       wait for 10 ns;
       assert S = "00001000" report "Incorrect result" severity error;

       A <= "1001";
       B <= "1001";
       wait for 10 ns;
       assert S = "00001001" report "Incorrect result" severity error;

       A <= "1010";
       B <= "1010";
       wait for 10 ns;
       assert S = "00001010" report "Incorrect result" severity error;

       A <= "1011";
       B <= "1011";
       wait for 10 ns;
       assert S = "00001011" report "Incorrect result" severity error;

       A <= "1100";
       B <= "1100";
       wait for 10 ns;
       assert S = "00001100" report "Incorrect result" severity error;

       A <= "1101";
       B <= "1101";
       wait for 10 ns;
       assert S = "00001101" report "Incorrect result" severity error;

       A <= "1110";
       B <= "1110";
       wait for 10 ns;
       assert S = "00001110" report "Incorrect result" severity error;

       A <= "1111";
       B <= "1111";
       wait for 10 ns;
       assert S = "00001111" report "Incorrect result" severity error;

   end process;
end architecture;