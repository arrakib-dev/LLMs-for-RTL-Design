
library ieee;
use ieee.std_logic_1164.all;
 
entity tb_demux_1x8 is
    -- empty
    end tb_demux_1x8; 
    
    architecture tb of tb_demux_1x8 is
    
    -- DUT component
    component demux_1x8 is
    port 
    ( s : in std_logic_vector (2 downto 0);
    o : out std_logic_vector (7 downto 0);
    i : in std_logic);
    end component;
    
    signal s : std_logic_vector (2 downto 0);
    signal o : std_logic_vector (7 downto 0);
    signal i : std_logic;
    
    begin
    
      -- Connect DUT
      DUT: demux_1x8 port map(
      s => s, 
      i => i,
      o => o );
    
      process
      begin
        s <= "000";
        i <= '1';
        wait for 10 ns;
        
        
        s <= "001";
        i <= '1';
        wait for 10 ns;
        
        
        s <= "010";
        i <= 'Z';
        wait for 10 ns;
        
       
        
        s <= "011";
        i <= '1';
        wait for 10 ns;
        
     
        s <= "100";
        i <= '1';
        wait for 10 ns;
        
            
        s <= "101";
        i <= '1';
        wait for 10 ns;
        
          
        s <= "110";
        i <= '1';
        wait for 10 ns;
        
           
        s <= "111";
        i <= '1';
        wait for 10 ns;
        
         
        wait;
      end process;
    end tb;