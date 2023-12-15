library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity somedevice is
  generic ( 
     constant N: natural := 1  
    );
  
    Port (
    A, B     : in  STD_LOGIC_VECTOR(7 downto 0);  
    DEVICE_Sel  : in  STD_LOGIC_VECTOR(3 downto 0);  
    DEVICE_Out   : out  STD_LOGIC_VECTOR(7 downto 0); 
    Carryout : out std_logic    
    );
end somedevice; 
architecture Behavioral of somedevice is

signal DEVICE_Result : std_logic_vector (7 downto 0);
signal tmp: std_logic_vector (8 downto 0);

begin
   process(A,B,DEVICE_Sel)
 begin
  case(DEVICE_Sel) is
  when "0000" => 
   DEVICE_Result <= A + B ; 
  when "0001" => 
   DEVICE_Result <= A - B ;
  when "0010" => 
   DEVICE_Result <= std_logic_vector(to_unsigned((to_integer(unsigned(A)) * to_integer(unsigned(B))),8)) ;
  when "0011" => 
   DEVICE_Result <= std_logic_vector(to_unsigned(to_integer(unsigned(A)) / to_integer(unsigned(B)),8)) ;
  when "0100" => 
   DEVICE_Result <= std_logic_vector(unsigned(A) sll N);
  when "0101" => 
   DEVICE_Result <= std_logic_vector(unsigned(A) srl N);
  when "0110" => 
   DEVICE_Result <= std_logic_vector(unsigned(A) rol N);
  when "0111" => 
   DEVICE_Result <= std_logic_vector(unsigned(A) ror N);
  when "1000" => 
   DEVICE_Result <= A and B;
  when "1001" =>
   DEVICE_Result <= A or B;
  when "1010" => 
   DEVICE_Result <= A xor B;
  when "1011" => 
   DEVICE_Result <= A nor B;
  when "1100" => 
   DEVICE_Result <= A nand B;
  when "1101" => 
   DEVICE_Result <= A xnor B;
  when "1110" => 
   if(A>B) then
    DEVICE_Result <= x"01" ;
   else
    DEVICE_Result <= x"00" ;
   end if; 
  when "1111" =>   
   if(A=B) then
    DEVICE_Result <= x"01" ;
   else
    DEVICE_Result <= x"00" ;
   end if;
  when others => DEVICE_Result <= A + B ; 
  end case;
 end process;
 DEVICE_Out <= DEVICE_Result; 
 tmp <= ('0' & A) + ('0' & B);
 Carryout <= tmp(8); 
end Behavioral;