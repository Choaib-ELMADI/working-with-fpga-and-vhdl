library ieee;
use ieee.std_logic_1164.all;

entity Add_2bits is
	port (
		A, B, cin : in  std_logic;
		sum       : out std_logic;
		cout      : out std_logic
	);
end Add_2bits;

architecture arch of Add_2bits is
begin

	sum  <= (A xor B) xor cin;
	cout <= (A and B) or ((A xor B) and cin);

end arch;
