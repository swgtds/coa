LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_ALU IS
END tb_ALU;
 
ARCHITECTURE behavior OF tb_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         ALU_Sel : IN  std_logic_vector(3 downto 0);
         ALU_Out : OUT  std_logic_vector(7 downto 0);
         Carryout : OUT  std_logic
        );
    END COMPONENT;
       --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal ALU_Sel : std_logic_vector(3 downto 0) := (others => '0');

  --Outputs
   signal ALU_Out : std_logic_vector(7 downto 0);
   signal Carryout : std_logic;
 
 signal i:integer;
BEGIN
 
 -- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          ALU_Sel => ALU_Sel,
          ALU_Out => ALU_Out,
          Carryout => Carryout
        );

 

   -- Stimulus process
   stim_proc: process
   begin  
      -- hold reset state for 100 ns.
      A <= x"0A";
  B <= x"02";
  ALU_Sel <= x"0";
  
  for i in 0 to 15 loop 
   ALU_Sel <= ALU_Sel + x"1";
   wait for 100 ns;
  end loop;
      A <= x"F6";
  B <= x"0A";
      wait;
   end process;

END;
