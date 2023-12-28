library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 

entity tb_accumulator_4bit is 
-- Testbench has no ports. 
end tb_accumulator_4bit; 

architecture behavior of tb_accumulator_4bit is 
-- Component Declaration for the Unit Under Test (UUT) 
    component accumulator_4bit port( 
        clk : in std_logic; 
        reset : in std_logic; 
        Din : in std_logic_vector(3 downto 0); 
        Q : out std_logic_vector(3 downto 0) ); 
    end component; 

    --Inputs 
    signal clk : std_logic := '0'; 
    signal reset : std_logic := '0'; 
    signal Din : std_logic_vector(3 downto 0) := (others => '0'); 

    --Outputs 
    signal Q : std_logic_vector(3 downto 0); 
    -- Clock period definitions 
    constant clk_period : time := 10 ns; 

    begin 
        -- Instantiate the Unit Under Test (UUT) 
        uut: accumulator_4bit port map ( clk => clk, reset => reset, Din => Din, Q => Q ); 
    
        -- Clock process definitions 
    clk_process :process 
    begin 
        clk <= '0'; 
        wait for clk_period/2; 
        clk <= '1'; 
        wait for clk_period/2; 
    end process; 

    -- Stimulus process 
    
    stim_proc: process 
    begin 
        -- hold reset state for 100 ns. 
        reset <= '1'; wait for 100 ns; 
        reset <= '0'; 
        -- apply first stimulus 
        Din <= "0001"; wait for clk_period*10;

         -- apply second stimulus 
        Din <= "0010"; wait for clk_period*10; 
    
        -- apply third stimulus 
        Din <= "0100"; wait for clk_period*10;
    
        -- apply fourth stimulus 
        Din <= "1000"; wait for clk_period*10; 
    
        -- Add more stimuli here 
    
        -- finish simulation 
        wait; 
    end process; 
end behavior;