library ieee;
use ieee.std_logic_1164.all;

entity full_adder_tb is
end entity;

architecture testbench of full_adder_tb is
--  signal a, b, cin, s, cout : std_logic;
signal a, b, s : std_logic_vector (3 downto 0);
signal cin, cout : std_logic;
begin
 dut : entity work.fulladder_4bit
   port map (
     a => a,
     b => b,
     cin => cin,
     s => s,
     cout => cout
   );

 stimulus : process
 begin
   a <= '0';
   b <= '0';
   cin <= '0';
   wait for 10 ns;
   assert s = '0' and cout = '0' report "FAIL: s = " & to_string(s) & ", cout = " & to_string(cout);

   a <= '0';
   b <= '1';
   cin <= '0';
   wait for 10 ns;
   assert s = '1' and cout = '0' report "FAIL: s = " & to_string(s) & ", cout = " & to_string(cout);

   a <= '1';
   b <= '0';
   cin <= '0';
   wait for 10 ns;
   assert s = '1' and cout = '0' report "FAIL: s = " & to_string(s) & ", cout = " & to_string(cout);

   a <= '1';
   b <= '1';
   cin <= '0';
   cin <= '1';
   wait for 10 ns;
   assert s = '1' and cout = '0' report "FAIL: s = " & to_string(s) & ", cout = " & to_string(cout);

   a <= '0';
   b <= '1';
   cin <= '1';
   wait for 10 ns;
   assert s = '0' and cout = '1' report "FAIL: s = " & to_string(s) & ", cout = " & to_string(cout);

   a <= '1';
   b <= '0';
   cin <= '1';
   wait for 10 ns;
   assert s = '0' and cout = '1' report "FAIL: s = " & to_string(s) & ", cout = " & to_string(cout);

   a <= '1';
   b <= '1';
   cin <= '1';
   wait for 10 ns;
   assert s = '1' and cout = '1' report "FAIL: s = " & to_string(s) & ", cout = " & to_string(cout);
 end process;
end architecture;
-- ';
--    wait for 10 ns;
--    assert s = '0' and cout = '1' report "FAIL: s = " & to_string(s) & ", cout = " & to_string(cout);

--    a <= '0';
--    b <= '0';
--    cin <= '1';
--    wait for 10 ns;
--    assert s = '1' and cout = '0' report "FAIL: s = " & to_string(s) & ", cout = " & to_string(cout);

--    a <= '0';
--    b <= '1';
--    cin <= '1';
--    wait for 10 ns;
--    assert s = '0' and cout = '1' report "FAIL: s = " & to_string(s) & ", cout = " & to_string(cout);

--    a <= '1';
--    b <= '0';
--    cin <= '1';
--    wait for 10 ns;
--    assert s = '0' and cout = '1' report "FAIL: s = " & to_string(s) & ", cout = " & to_string(cout);

--    a <= '1';
--    b <= '1';
--    cin <= '1';
--    wait for 10 ns;
--    assert s = '1' and cout = '1' report "FAIL: s = " & to_string(s) & ", cout = " & to_string(cout);
--  end process;
-- end architecture;