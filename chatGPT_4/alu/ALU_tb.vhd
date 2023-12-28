LIBRARY ieee; USE ieee.std_logic_1164.ALL; USE ieee.std_logic_unsigned.ALL; USE ieee.numeric_std.ALL; 

ENTITY ALU_tb IS
 END ALU_tb;
 
 ARCHITECTURE behavior OF ALU_tb IS
 
 -- Component Declaration for the Unit Under Test (UUT) 
 
 COMPONENT ALU PORT(
   A : IN std_logic_vector(7 downto 0); 
   B : IN std_logic_vector(7 downto 0); 
   ALU_Sel : IN std_logic_vector(3 downto 0); 
   ALU_Out : OUT std_logic_vector(7 downto 0); 
   Carryout : OUT std_logic ); 
   END COMPONENT; 
   
   --Inputs 
   signal A : std_logic_vector(7 downto 0) := (others => '0'); 
   signal B : std_logic_vector(7 downto 0) := (others => '0'); 
   signal ALU_Sel : std_logic_vector(3 downto 0) := (others => '0'); 
   
   --Outputs 
   
   signal ALU_Out : std_logic_vector(7 downto 0); signal Carryout : std_logic; 
   
   -- Clock period definitions
   
   constant clk_period : time := 10 ns; BEGIN -- Instantiate the Unit Under Test (UUT) 
   uut: ALU PORT MAP ( A => A, B => B, ALU_Sel => ALU_Sel, ALU_Out => ALU_Out, Carryout => Carryout );
   
   -- Stimulus process 
   stim_proc: process begin 
    -- hold reset state for 100 ns.
     wait for 100 ns; -- Add stimuli here
     
     A <= "00000001"; B <= "00000001"; ALU_Sel <= "0000"; -- Addition 
     
     wait for clk_period; A <= "00000010"; B <= "00000001"; ALU_Sel <= "0001"; -- Subtraction
     
     wait for clk_period; A <= "00000010"; B <= "00000010"; ALU_Sel <= "0010"; -- Multiplication
     
     wait for clk_period; -- Add more test cases for each operation as needed. -- Complete the simulation 















wait; end process; END; 