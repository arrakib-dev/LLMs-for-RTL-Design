LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY shiftreg_tb IS
END shiftreg_tb;

ARCHITECTURE behavior OF shiftreg_tb IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT shiftreg
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         load : IN  std_logic;
         d : IN  std_logic_vector(7 downto 0);
         q : BUFFER std_logic
        );
    END COMPONENT;
   
    --Inputs
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal load : std_logic := '0';
    signal d : std_logic_vector(7 downto 0) := (others => '0');

    --Output
    signal q : std_logic;

    -- Clock period definitions
    constant clk_period : time := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: shiftreg PORT MAP (
          clk => clk,
          rst => rst,
          load => load,
          d => d,
          q => q
        );

    -- Clock process definitions
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Testbench stimuli
    stim_proc: process
    begin       
        -- reset
        rst <= '1';
        wait for 20 ns;
        rst <= '0';
        
        -- load data
        load <= '1';
        d <= "10101010";
        wait for clk_period;
        load <= '0';
        
        -- wait and let it shift
        wait for 100 ns;
        
        -- load new data
        load <= '1';
        d <= "11001100";
        wait for clk_period;
        load <= '0';
        
        -- Finish simulation
        wait for 200 ns;
        wait;
    end process;

END behavior;