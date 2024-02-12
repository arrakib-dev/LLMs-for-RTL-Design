--LIBRARY ieee;
--USE ieee.std_logic_1164.ALL;
---- fpga4student.com: FPGA projects, Verilog projects, VHDL projects
---- VHDL project: VHDL code for single-cycle MIPS Processor
---- VHDL testbench code for single-cycle MIPS Processor
--ENTITY tb_MIPS_VHDL IS
--END tb_MIPS_VHDL;
 
--ARCHITECTURE behavior OF tb_MIPS_VHDL IS 
--    -- Component Declaration for the single-cycle MIPS Processor in VHDL
--    COMPONENT MIPS_VHDL
--    PORT(
--         clk : IN  std_logic;
--         reset : IN  std_logic;
--         pc_out : OUT  std_logic_vector(15 downto 0);
--         alu_result : OUT  std_logic_vector(15 downto 0)
--        );
--    END COMPONENT;
--   --Inputs
--   signal clk : std_logic := '0';
--   signal reset : std_logic := '0';
--   --Outputs
--   signal pc_out : std_logic_vector(15 downto 0);
--   signal alu_result : std_logic_vector(15 downto 0);
--   -- Clock period definitions
--   constant clk_period : time := 10 ns;
--BEGIN
-- -- Instantiate the for the single-cycle MIPS Processor in VHDL
--   uut: MIPS_VHDL PORT MAP (
--          clk => clk,
--          reset => reset,
--          pc_out => pc_out,
--          alu_result => alu_result
--        );

--   -- Clock process definitions
--   clk_process :process
--   begin
--  clk <= '0';
--  wait for clk_period/2;
--  clk <= '1';
--  wait for clk_period/2;
--   end process;
--   -- Stimulus process
--   stim_proc: process
--   begin  
--      reset <= '1';
--      wait for clk_period*10;
--  reset <= '0';
--      -- insert stimulus here 
--      wait;
--   end process;

--END;
-- -----------------  gpt 3.5 --------------------------------------------------------------

--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;

--entity MIPS_TestBench is
--end MIPS_TestBench;

--architecture Behavioral of MIPS_TestBench is
--    -- Component declaration for the MIPS processor
--    component MIPS_VHDL
--        port (
--            clk, reset: in std_logic;
--            pc_out, alu_result: out std_logic_vector(15 downto 0)
--        );
--    end component;

--    -- Signals for test bench
--    signal clk_tb, reset_tb: std_logic := '0';
--    signal pc_out_tb, alu_result_tb: std_logic_vector(15 downto 0);

--    -- Clock period definition
--    constant clk_period: time := 10 ns;

--begin

--    -- Instantiate the MIPS processor
--    UUT: MIPS_VHDL port map (
--        clk => clk_tb,
--        reset => reset_tb,
--        pc_out => pc_out_tb,
--        alu_result => alu_result_tb
--    );

--    -- Clock generation process
--    clk_process: process
--    begin
--        while now < 500 ns loop
--            clk_tb <= '0';
--            wait for clk_period / 2;
--            clk_tb <= '1';
--            wait for clk_period / 2;
--        end loop;
--        wait;
--    end process;

--    -- Reset process
--    reset_process: process
--    begin
--        reset_tb <= '1';
--        wait for 20 ns; -- Apply reset for 20 ns
--        reset_tb <= '0';
--        wait;
--    end process;

--    -- Stimulus process
--    stimulus: process
--    begin
--        -- Wait for initial reset and clock setup
--        wait for 50 ns;

--        -- Add test cases here (e.g., setting inputs, observing outputs)

--        wait;
--    end process;

--end Behavioral;

-- ------------------------- gpt 4 -----------------------------------------------------------

--LIBRARY ieee;
--USE ieee.std_logic_1164.ALL;
--USE ieee.std_logic_arith.ALL;
--USE ieee.std_logic_unsigned.ALL;

--ENTITY MIPS_VHDL_TB IS
--END MIPS_VHDL_TB;

--ARCHITECTURE behavior OF MIPS_VHDL_TB IS 

--    -- Component Declaration for the Unit Under Test (UUT)
--    COMPONENT MIPS_VHDL
--    PORT(
--         clk : IN  std_logic;
--         reset : IN  std_logic;
--         pc_out : OUT  std_logic_vector(15 downto 0);
--         alu_result : OUT  std_logic_vector(15 downto 0)
--        );
--    END COMPONENT;
   
--   --Inputs
--   signal clk : std_logic := '0';
--   signal reset : std_logic := '0';

--   --Outputs
--   signal pc_out : std_logic_vector(15 downto 0);
--   signal alu_result : std_logic_vector(15 downto 0);

--   -- Clock period definitions
--   constant clk_period : time := 10 ns;
 
--BEGIN

--	-- Instantiate the Unit Under Test (UUT)
--   uut: MIPS_VHDL PORT MAP (
--          clk => clk,
--          reset => reset,
--          pc_out => pc_out,
--          alu_result => alu_result
--        );

--   -- Clock process definitions
--   clk_process :process
--   begin
--		clk <= '0';
--		wait for clk_period/2;
--		clk <= '1';
--		wait for clk_period/2;
--   end process;
   
--   -- Stimulus process
--   stim_proc: process
--   begin		
--      -- hold reset state for 100 ns.
--      reset <= '1';
--      wait for 100 ns;
--      reset <= '0';
      
--      -- Add your test vectors here

--      -- Example: Wait for the rest of the simulation
--      wait;
--   end process;

--END;
   -- ------------------------- Gemini  --------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity MIPS_VHDL_tb is
end MIPS_VHDL_tb;

architecture Behavioral of MIPS_VHDL_tb is

  constant CLK_PERIOD : time := 10 ns;

  signal clk : std_logic := '0';
  signal reset : std_logic := '1';

  signal pc_out_tb : std_logic_vector(15 downto 0);
  signal alu_result_tb : std_logic_vector(15 downto 0);
  
  component MIPS_VHDL
        port (
            clk : in std_logic;
            reset : in std_logic;
            pc_out : out std_logic_vector(15 downto 0);
            alu_result : out std_logic_vector(15 downto 0)
        );
    end component;

  -- Additional signals for monitoring internal state (optional)
  -- signal reg_file_tb : std_logic_vector(31 downto 0); -- Example

begin
DUT: MIPS_VHDL port map (
    clk => clk,
    reset => reset,
    pc_out => pc_out_tb,
    alu_result => alu_result_tb
  );
  -- Clock generation process
  process
  begin
    while true loop
      clk <= '1';
      wait for CLK_PERIOD/2;
      clk <= '0';
      wait for CLK_PERIOD/2;
    end loop;
  end process;

  -- Reset pulse
  process
  begin
    reset <= '1';
    wait for CLK_PERIOD*5;
    reset <= '0';
    
    wait;
  end process;

end Behavioral;

-- --------------------------- codellama -----------------------------------

--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;

---- Entity declaration for the testbench
--entity tb_MIPS_VHDL is
--end tb_MIPS_VHDL;

--architecture behavior of tb_MIPS_VHDL is
--    -- Component declarations for the DUT and clock generation module
--    component MIPS_VHDL
--        port (
--            clk : in std_logic;
--            reset : in std_logic;
--            pc_out : out std_logic_vector(15 downto 0);
--            alu_result : out std_logic_vector(15 downto 0)
--        );
--    end component;
    
--    constant CLK_PERIOD : time := 1 ns;
--    signal clk : std_logic := '0';
--    signal reset : std_logic := '0';
--    signal pc_out : std_logic_vector(15 downto 0);
--    signal alu_result : std_logic_vector(15 downto 0);

--begin
--    uut : MIPS_VHDL
--        port map (
--            clk         => clk,
--            reset       => reset,
--            pc_out      => pc_out,
--            alu_result  => alu_result
--        );

--    -- Clock Generation Process
--    p_CLKGEN : process
--    begin
--        wait until rising_edge(clk);
--        clk <= not clk after CLK_PERIOD / 2;
--    end process p_CLKGEN;

--    -- Main Test Sequence
--    p_TESTSEQ : process
--    begin
--        report "[msg] Starting simulation...";
--        reset <= '1', '0' after 1 us;
--        wait for 1 ms;
--        assert false severity failure;
--    end process p_TESTSEQ;

--end behavior;