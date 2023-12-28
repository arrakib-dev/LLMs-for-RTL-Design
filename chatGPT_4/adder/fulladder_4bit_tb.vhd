library IEEE; use IEEE.std_logic_1164.all; entity fulladder_4bit_tb is 
    -- Testbench has no ports 
    end fulladder_4bit_tb; architecture tb of fulladder_4bit_tb is 
    -- Signal declarations 
    signal a, b: std_logic_vector(3 downto 0); signal cin: std_logic; signal s: std_logic_vector(3 downto 0); signal cout: std_logic; 
    -- Instantiate the Unit Under Test (UUT)
     component fulladder_4bit port( a, b: in std_logic_vector(3 downto 0); cin: in std_logic; s: out std_logic_vector(3 downto 0); cout: out std_logic ); end component; 
     begin uut: fulladder_4bit port map (a, b, cin, s, cout); -- Stimulus process 
     stim_proc: process begin
         -- Test Case 1
          a <= "0000"; b <= "0000"; cin <= '0'; wait for 100 ns; 
          -- Test Case 2
           a <= "0001"; b <= "0010"; cin <= '0'; wait for 100 ns; 
           -- Test Case 3 
           a <= "0101"; b <= "0101"; cin <= '1'; wait for 100 ns; 
           -- Test Case 4 
           a <= "1111"; b <= "1111"; cin <= '0'; wait for 100 ns; 
           -- Test Case 5 
           a <= "1010"; b <= "0101"; cin <= '1'; wait for 100 ns; -- Add more test cases as needed -- End simulation
    
    
    
    wait; end process; end tb; 