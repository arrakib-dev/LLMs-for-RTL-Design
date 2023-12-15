library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity ALU_tb is
end ALU_tb;

architecture Behavioral of ALU_tb is

constant N: natural := 1;

signal A, B : std_logic_vector(7 downto 0);
signal ALU_Sel : std_logic_vector(3 downto 0);
signal ALU_Out : std_logic_vector(7 downto 0);
signal Carryout : std_logic;

signal expected_result : std_logic_vector(7 downto 0);
signal expected_carryout : std_logic;

begin

   -- Instantiate the ALU
   DUT: entity work.ALU port map(
        A => A,
        B => B,
        ALU_Sel => ALU_Sel,
        ALU_Out => ALU_Out,
        Carryout => Carryout
   );

   -- Test cases
   process
     begin
     --   -- Test case 1: Addition
     --   ALU_Sel <= "0000";
     --   A <= "0001";
     --   B <= "0001";
     --   expected_result <= "0001";
     --   expected_carryout <= '0';

     --   assert ALU_Out = expected_result report "Incorrect addition result" severity error;
     --   assert Carryout = expected_carryout report "Incorrect carryout" severity error;

     --   -- Test case 2: Subtraction
     --   ALU_Sel <= "0001";
     --   A <= "0010";
     --   B <= "0001";
     --   expected_result <= "0000";
     --   expected_carryout <= '0';

     --   assert ALU_Out = expected_result report "Incorrect subtraction result" severity error;
     --   assert Carryout = expected_carryout report "Incorrect carryout" severity error;

     --   -- Test case 3: Multiplication
     --   ALU_Sel <= "0010";
     --   A <= "0101";
     --   B <= "0011";
     --   expected_result <= "0100";
     --   expected_carryout <= '0';

     --   assert ALU_Out = expected_result report "Incorrect multiplication result" severity error;
     --   assert Carryout = expected_carryout report "Incorrect carryout" severity error;

     --   -- Test case 4: Division
     --   ALU_Sel <= "0011";
     --   A <= "1000";
     --   B <= "0111";
     --   expected_result <= "100";
     --   expected_carryout <= '0';

     --   assert ALU_Out = expected_result report "Incorrect division result" severity error;
     --   assert Carryout = expected_carryout report "Incorrect carryout" severity error;

       -- Test case 5: Logical Shift Left
       ALU_Sel <= "0100";
       A <= "01110000";
       expected_result <= "11110000";
       expected_carryout <= '0';

       assert ALU_Out = expected_result report "Incorrect logical shift left result" severity error;
       assert Carryout = expected_carryout report "Incorrect carryout" severity error;

       -- Test case 6: Logical Shift Right
       ALU_Sel <= "0101";
       A <= "11110000";
       expected_result <= "01110000";
       expected_carryout <= '0';

       assert ALU_Out = expected_result report "Incorrect logical shift right result" severity error;
       assert Carryout = expected_carryout report "Incorrect carryout" severity error;

       -- Test case 7: Rotate Left
       ALU_Sel <= "0110";
       A <= "01110000";
       expected_result <= "11100001";
       expected_carryout <= '0';

       assert ALU_Out = expected_result report "Incorrect rotate left result" severity error;
       assert Carryout = expected_carryout report "Incorrect carryout" severity error;
       wait;
     
     end process;
end Behavioral;
