library IEEE; 
use IEEE.std_logic_1164.all;

entity tb_register_8bit is

end;

architecture rtl of tb_register_8bit is

    signal clk, rst: std_logic;
    signal d, q: std_logic_vector(7 downto 0);
    component register_8bit is
        port (
            clk, rst: in  std_logic;
            d       : in  std_logic_vector(7 downto 0);
            q       : out std_logic_vector(7 downto 0)
        );
    end component;

begin
    uut: register_8bit port map(
        clk => clk,
        rst => rst,
        d => d,
        q => q
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

        d <= "00001001";
        wait for 10 ns;
        assert q = "00001001" report "Output not correct" severity error;

        d <= "01001001";
        wait for 10 ns;
        assert q = "01001001" report "Output not correct" severity error;

        d <= "00101001";
        wait for 10 ns;
        assert q = "00101001" report "Output not correct" severity error;

        d <= "01001001";
        wait for 10 ns;
        assert q = "01001001" report "Output not correct" severity error;

        
        rst <= '1';
        wait for 10 ns; 
        assert q = "00000000" report "Output not correct" severity error;

        wait;
    end process;



end architecture;