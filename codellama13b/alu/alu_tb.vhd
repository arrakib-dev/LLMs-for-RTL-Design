library ieee;
use ieee.std_logic_1164.all;

entity alu_tb is
end entity;

architecture testbench of alu_tb is
   signal a, b : std_logic_vector(7 downto 0);
   signal sel : std_logic_vector(3 downto 0);
   signal result : std_logic_vector(7 downto 0);
begin
   dut : entity work.alu
       port map (
           A => a,
           B => b,
           ALU_Sel => sel,
           ALU_Out => result
       );

   process
   begin
       -- Test addition
       a <= "00000001";
       b <= "00000010";
       sel <= "0000";
       wait for 10 ns;
       assert result = "00000011" report "Addition failed" severity error;

       -- Test subtraction
       a <= "00000010";
       b <= "00000001";
       sel <= "0001";
       wait for 10 ns;
       assert result = "00000001" report "Subtraction failed" severity error;

       -- Test multiplication
       a <= "00000001";
       b <= "00000010";
       sel <= "0010";
       wait for 10 ns;
       assert result = "00000010" report "Multiplication failed" severity error;

       -- Test division
       a <= "00000010";
       b <= "00000001";
       sel <= "0011";
       wait for 10 ns;
       assert result = "00000010" report "Division failed" severity error;

       -- Test logical shift left
       a <= "00000001";
       b <= "00000010";
       sel <= "0100";
       wait for 10 ns;
       assert result = "00000010" report "Logical shift left failed" severity error;

       -- Test logical shift right
       a <= "00000010";
       b <= "00000001";
       sel <= "0101";
       wait for 10 ns;
       assert result = "00000001" report "Logical shift right failed" severity error;

       -- Test rotate left
       a <= "00000001";
       b <= "00000010";
       sel <= "0110";
       wait for 10 ns;
       assert result = "00000010" report "Rotate left failed" severity error;

       -- Test rotate right
       a <= "00000010";
       b <= "00000001";
       sel <= "0111";
       wait for 10 ns;
       assert result = "00000001" report "Rotate right failed" severity error;

       -- Test logical and
       a <= "00000001";
       b <= "00000010";
       sel <= "1000";
       wait for 10 ns;
       assert result = "00000000" report "Logical and failed" severity error;

       -- Test logical or
       a <= "00000010";
       b <= "00000001";
       sel <= "1001";
       wait for 10 ns;
       assert result = "00000011" report "Logical or failed" severity error;

       -- Test logical xor
       a <= "00000001";
       b <= "00000010";
       sel <= "1010";
       wait for 10 ns;
       assert result = "00000011" report "Logical xor failed" severity error;

       -- Test logical nor
       a <= "00000010";
       b <= "00000001";
       sel <= "1011";
       wait for 10 ns;
       assert result = "00000000" report "Logical nor failed" severity error;

       -- Test logical nand
       a <= "00000001";
       b <= "00000010";
       sel <= "1100";
       wait for 10 ns;
       assert result = "00000000" report "Logical nand failed" severity error;

       -- Test logical xnor
       a <= "00000010";
       b <= "00000001";
       sel <= "1101";
       wait for 10 ns;
       assert result = "00000001" report "Logical xnor failed" severity error;

       -- Test greater comparison
       a <= "00000010";
       b <= "00000001";
       sel <= "1110";
       wait for 10 ns;
       assert result = "00000001" report "Greater comparison failed" severity error;

       -- Test equal comparison
       a <= "00000010";
       b <= "00000001";
       sel <= "1111";
       wait for 10 ns;
       assert result = "00000001" report "Equal comparison failed" severity error;
   end process;
end architecture;