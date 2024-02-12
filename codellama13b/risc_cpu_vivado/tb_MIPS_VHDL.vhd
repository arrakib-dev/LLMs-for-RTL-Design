library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

---- Entity declaration for the testbench
entity tb_MIPS_VHDL is
end tb_MIPS_VHDL;

architecture behavior of tb_MIPS_VHDL is
--    -- Component declarations for the DUT and clock generation module
    component MIPS_VHDL
        port (
            clk : in std_logic;
            reset : in std_logic;
            pc_out : out std_logic_vector(15 downto 0);
            alu_result : out std_logic_vector(15 downto 0)
        );
    end component;
    
    constant CLK_PERIOD : time := 1 ns;
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal pc_out : std_logic_vector(15 downto 0);
    signal alu_result : std_logic_vector(15 downto 0);

begin
    uut : MIPS_VHDL
        port map (
            clk         => clk,
            reset       => reset,
            pc_out      => pc_out,
            alu_result  => alu_result
        );

    -- Clock Generation Process
    p_CLKGEN : process
    begin
        wait until rising_edge(clk);
        clk <= not clk after CLK_PERIOD / 2;
    end process p_CLKGEN;

    -- Main Test Sequence
    p_TESTSEQ : process
    begin
        report "[msg] Starting simulation...";
        reset <= '1', '0' after 1 us;
        wait for 1 ms;
        assert false severity failure;
    end process p_TESTSEQ;

end behavior;