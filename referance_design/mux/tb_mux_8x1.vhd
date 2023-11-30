-- Testbench for 8 to 1 Multiplexer
library ieee;
use ieee.std_logic_1164.all;
 
entity tb_mux_8x1 is
    -- empty
    end tb_mux_8x1; 
    
    architecture tb of tb_mux_8x1 is
    
    -- DUT component
    component mux_8x1 is
    port 
    ( s : in std_logic_vector (2 downto 0);
    d : in std_logic_vector (7 downto 0);
    o : out std_logic);
    end component;
    
    signal s : std_logic_vector (2 downto 0);
    signal d : std_logic_vector (7 downto 0);
    signal y : std_logic;
    
    begin
    
      -- Connect DUT
      DUT: mux_8x1 port map(
      s => s, 
      d => d,
      o => y );
    
      process
      begin
        s <= "000";
        d <= "00000001";
        wait for 1 ns;
        
        
        s <= "001";
        d <= "00000010";
        wait for 1 ns;
        
        
        s <= "010";
        d <= "00000100";
        wait for 1 ns;
        
       
        
        s <= "011";
        d <= "00001000";
        wait for 1 ns;
        
     
        s <= "100";
        d <= "00010000";
        wait for 1 ns;
        
            
        s <= "101";
        d <= "00100000";
        wait for 1 ns;
        
          
        s <= "110";
        d <= "01000000";
        wait for 1 ns;
        
           
        s <= "111";
        d <= "10000000";
        wait for 1 ns;
        
         
        wait;
      end process;
    end tb;