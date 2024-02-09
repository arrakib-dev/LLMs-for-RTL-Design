library ieee;
use ieee.std_logic_1164.all;

entity tb_ram is
end entity;

architecture testbench of tb_ram is
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal addr : std_logic_vector(6 downto 0) := (others => '0');
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');
   signal data_out : std_logic_vector(7 downto 0);
begin
   uut : entity work.ram
       port map (
           RAM_CLOCK => clk,
           RAM_WR => rst,
           RAM_ADDR => addr,
           RAM_DATA_IN => data_in,
           RAM_DATA_OUT => data_out
       );

   clk <= not clk after 10 ns;

   process
   begin
       rst <= '1';
       wait for 10 ns;
       rst <= '0';
       wait for 10 ns;

    --    addr <= "000000";
    --    data_in <= "000000000";
    --    wait for 10 ns;

       addr <= "0000001";
       data_in <= "00000001";
       wait for 10 ns;

       addr <= "0000010";
       data_in <= "00000010";
       wait for 10 ns;

       addr <= "0000011";
       data_in <= "00000011";
       wait for 10 ns;

       addr <= "0000100";
       data_in <= "00000100";
       wait for 10 ns;

       addr <= "0001001";
       data_in <= "00000101";
       wait for 10 ns;

       addr <= "0001100";
       data_in <= "00000110";
       wait for 10 ns;

       addr <= "0001110";
       data_in <= "00000111";
       wait for 10 ns;

       addr <= "0010000";
       data_in <= "00001000";
       wait for 10 ns;

       addr <= "0010010";
       data_in <= "00001001";
       wait for 10 ns;

       addr <= "0001010";
       data_in <= "00001010";
       wait for 10 ns;

       addr <= "0001011";
       data_in <= "00001011";
       wait for 10 ns;

       addr <= "0001100";
       data_in <= "00001100";
       wait for 10 ns;

       addr <= "0010101";
       data_in <= "00001101";
       wait for 10 ns;

    --    addr <= "001110";
    --    data_in <= "0000000000001110";
    --    wait for 10 ns;

    --    addr <= "001111";
    --    data_in <= "0000000000001111";
    --    wait for 10 ns;

    --    addr <= "010000";
    --    data_in <= "0000000000010000";
    --    wait for 10 ns;

    --    addr <= "010001";
    --    data_in <= "0000000000010001";
    --    wait for 10 ns;

    --    addr <= "010010";
    --    data_in <= "0000000000010010";
    --    wait for 10 ns;

    --    addr <= "010011";
    --    data_in <= "0000000000010011";
    --    wait for 10 ns;

    --    addr <= "010100";
    --    data_in <= "0000000000010100";
    --    wait for 10 ns;

    --    addr <= "010101";
    --    data_in <= "0000000000010101";
    --    wait for 10 ns;

    --    addr <= "010110";
    --    data_in <= "0000000000010110";
    --    wait for 10 ns;

    --    addr <= "010111";
    --    data_in <= "0000000000010111";
    --    wait for 10 ns;

    --    addr <= "011000";
    --    data_in <= "0000000000011000";
    --    wait for 10 ns;

    --    addr <= "011001";
    --    data_in <= "0000000000011001";
    --    wait for 10 ns;

    --    addr <= "011010";
    --    data_in <= "0000000000011010";
    --    wait for 10 ns;

    --    addr <= "011011";
    --    data_in <= "0000000000011011";
    --    wait for 10 ns;

    --    addr <= "011100";
    --    data_in <= "0000000000011100";
    --    wait for 10 ns;

    --    addr <= "011101";
    --    data_in <= "0000000000011101";
    --    wait for 10 ns;

    --    addr <= "011110";
    --    data_in <= "0000000000011110";
    --    wait for 10 ns;

    --    addr <= "011111";
    --    data_in <= "0000000000011111";
    --    wait for 10 ns;

    --    addr <= "100000";
    --    data_in <= "0000000000100000";
    --    wait for 10 ns;

    --    addr <= "100001";
    --    data_in <= "0000000000100001";
    --    wait for 10 ns;

    --    addr <= "100010";
    --    data_in <= "0000000000100010";
    --    wait for 10 ns;

    --    addr <= "100011";
    --    data_in <= "0000000000100011";
    --    wait for 10 ns;

    --    addr <= "100100";
    --    data_in <= "0000000000100100";
    --    wait for 10 ns;

    --    addr <= "101000";
    --    data_in <= "0000000000101000";
    --    wait for 10 ns;

    --    addr <= "101001";
    --    data_in <= "0000000000101001";
    --    wait for 10 ns;

    --    addr <= "101010";
    --    data_in <= "0000000000101010";
    --    wait for 10 ns;

    --    addr <= "101011";
    --    data_in <= "0000000000101011";
    --    wait for 10 ns;

    --    addr <= "101100";
    --    data_in <= "0000000000101100";
    --    wait for 10 ns;

    --    addr <= "101101";
    --    data_in <= "0000000000101101";
    --    wait for 10 ns;

    --    addr <= "101110";
    --    data_in <= "0000000000101110";
    --    wait for 10 ns;

    --    addr <= "101111";
    --    data_in <= "0000000000101111";
    --    wait for 10 ns;

    --    addr <= "110000";
    --    data_in <= "0000000000110000";
    --    wait for 10 ns;

    --    addr <= "110001";
    --    data_in <= "0000000000110001";
    --    wait for 10 ns;

    --    addr <= "110010";
    --    data_in <= "0000000000110010";
    --    wait for 10 ns;

    --    addr <= "110011";
    --    data_in <= "0000000000110011";
    --    wait for 10 ns;

    --    addr <= "110100";
    --    data_in <= "0000000000110100";
    --    wait for 10 ns;

    --    addr <= "110101";
    --    data_in <= "0000000000110101";
    --    wait for 10 ns;

    --    addr <= "110110";
    --    data_in <= "0000000000110110";
    --    wait for 10 ns;

    --    addr <= "110111";
    --    data_in <= "0000000000110111";
    --    wait for 10 ns;

    --    addr <= "111000";
    --    data_in <= "0000000000111000";
    --    wait for 10 ns;

    --    addr <= "111001";
    --    data_in <= "0000000000111001";
    --    wait for 10 ns;

    --    addr <= "111010";
    --    data_in <= "0000000000111010";
    --    wait for 10 ns;

    --    addr <= "111011";
    --    data_in <= "0000000000111011";
    --    wait for 10 ns;

    --    addr <= "111100";
    --    data_in <= "0000000000111100";
    --    wait for 10 ns;

    --    addr <= "111101";
    --    data_in <= "0000000000111101";
    --    wait for 10 ns;

    --    addr <= "111110";
    --    data_in <= "0000000000111110";
    --    wait for 10 ns;

    --    addr <= "111111";
    --    data_in <= "0000000000111111";
    --    wait for 10 ns;

       wait;
   end process;
end architecture;     