library IEEE; 
use IEEE.std_logic_1164.all;

entity tb_shift_reg is

end;

architecture rtl of tb_shift_reg is

    signal clk, rst, load, q: std_logic;
    signal d: std_logic_vector(7 downto 0);
    
    component shiftreg is
        port ( 
        clk, rst : in     std_logic;
        load     : in     std_logic;
        d        : in     std_logic_vector(7 downto 0);
        q        : buffer std_logic
      );
    end component;

begin
    uut: shiftreg port map(
        clk => clk,
        rst => rst,
        d => d,
        q => q,
        load => load
    );

    clock_process :process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

    stim_proc: process
    begin        
        rst <= '1';
        wait for 10 ns;    
        rst <= '0';

        d <= "10001001";
        load <= '1';
        wait for 10 ns;
        load <= '0';

        wait for 100 ns;
        
        rst <= '1';
        wait for 10 ns; 

        wait;
    end process;



end architecture;