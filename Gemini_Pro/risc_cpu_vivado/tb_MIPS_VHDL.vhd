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