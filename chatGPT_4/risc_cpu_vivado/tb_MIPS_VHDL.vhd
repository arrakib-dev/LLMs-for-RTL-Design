LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY MIPS_VHDL_TB IS
END MIPS_VHDL_TB;

ARCHITECTURE behavior OF MIPS_VHDL_TB IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT MIPS_VHDL
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         pc_out : OUT  std_logic_vector(15 downto 0);
         alu_result : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
   
   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

   --Outputs
   signal pc_out : std_logic_vector(15 downto 0);
   signal alu_result : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: MIPS_VHDL PORT MAP (
          clk => clk,
          reset => reset,
          pc_out => pc_out,
          alu_result => alu_result
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
   
--   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      reset <= '1';
      wait for 100 ns;
      reset <= '0';
      
      -- Add your test vectors here

--      -- Example: Wait for the rest of the simulation
      wait;
   end process;

END;