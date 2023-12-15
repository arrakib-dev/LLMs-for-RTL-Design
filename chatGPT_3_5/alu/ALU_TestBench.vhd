library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity ALU_TestBench is
end ALU_TestBench;

architecture TB_ARCH of ALU_TestBench is
  signal A, B, ALU_Sel, ALU_Out : std_logic_vector(7 downto 0);
  signal Carryout : std_logic;

  constant CLK_PERIOD : time := 10 ns;  -- Clock period in nanoseconds
  signal CLK : std_logic := '0';        -- Clock signal

  -- Stimulus process
  procedure Stimulus(
    constant A_val     : in std_logic_vector;
    constant B_val     : in std_logic_vector;
    constant ALU_Sel_val : in std_logic_vector;
    constant expected_result : in std_logic_vector
  ) is
  begin
    A <= A_val;
    B <= B_val;
    ALU_Sel <= ALU_Sel_val;

    wait for CLK_PERIOD / 2;  -- Wait for half a clock cycle

    assert ALU_Out = expected_result
      report "Test Failed!"
      severity error;

    wait for CLK_PERIOD / 2;  -- Wait for another half clock cycle
  end Stimulus;

begin
  -- Instantiate the ALU
  UUT: entity work.ALU
    port map (
      A => A,
      B => B,
      ALU_Sel => ALU_Sel,
      ALU_Out => ALU_Out,
      Carryout => Carryout
    );

  -- Clock generation process
  CLK_PROCESS: process
  begin
    while now < 100 ns loop
      CLK <= not CLK;
      wait for CLK_PERIOD / 2;
    end loop;
    wait;
  end process CLK_PROCESS;

  -- Test cases
  TEST_CASE_1: process
  begin
    Stimulus("00101010", "00001111", "0000", "01011001"); -- Addition
    Stimulus("00101010", "00001111", "0001", "00001011"); -- Subtraction
    Stimulus("00101010", "00001111", "0010", "01111010"); -- Multiplication
    Stimulus("00101010", "00001111", "0011", "00000010"); -- Division
    Stimulus("00101010", "00001111", "0100", "10101000"); -- Logical shift left
    Stimulus("00101010", "00001111", "0101", "00001010"); -- Logical shift right
    Stimulus("00101010", "00001111", "0110", "01010010"); -- Rotate left
    Stimulus("00101010", "00001111", "0111", "10001011"); -- Rotate right
    Stimulus("00101010", "00001111", "1000", "00001010"); -- Logical AND
    Stimulus("00101010", "00001111", "1001", "00101111"); -- Logical OR
    Stimulus("00101010", "00001111", "1010", "00100101"); -- Logical XOR
    Stimulus("00101010", "00001111", "1011", "11110000"); -- Logical NOR
    Stimulus("00101010", "00001111", "1100", "11110101"); -- Logical NAND
    Stimulus("00101010", "00001111", "1101", "11011010"); -- Logical XNOR
    Stimulus("00101010", "00001111", "1110", "01");       -- Greater comparison
    Stimulus("00101010", "00101010", "1111", "01");       -- Equal comparison

    wait;
  end process TEST_CASE_1;

end TB_ARCH;
