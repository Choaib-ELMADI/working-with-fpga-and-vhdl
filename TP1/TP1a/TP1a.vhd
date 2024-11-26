library ieee;
use ieee.std_logic_1164.all;

entity TP1a is
	port (
		sw   : in  std_logic_vector(1 downto 0);
		ledr : out std_logic_vector(0 downto 0)
	);
end TP1a;

architecture arch of TP1a is
begin
	ledr(0) <= sw(0) and sw(1);
end arch;
