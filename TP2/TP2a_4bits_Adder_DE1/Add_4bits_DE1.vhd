library ieee;
use ieee.std_logic_1164.all;

entity Add_4bits_DE1 is
	port (
		SW   : in  std_logic_vector(7 downto 0);
		LEDR : out std_logic_vector(9 downto 0)
	);
end Add_4bits_DE1;

architecture arch of Add_4bits_DE1 is
	component add_2bits is
		port (
			A, B, Cin : in  std_logic;
			sum       : out std_logic;
			cout      : out std_logic
		);
	end add_2bits;

	signal cout, ovf    : std_logic;
	signal A, B, C, sum : std_logic_vector(3 downto 0);

begin
	s0: add_2bits port map (A => A(0), B => B(0), Cin => '0',  sum => sum(0), cout=> C(0));
	s1: add_2bits port map (A => A(1), B => B(1), Cin => C(0), sum => sum(1), cout=> C(1));
	s2: add_2bits port map (A => A(2), B => B(2), Cin => C(1), sum => sum(2), cout=> C(2));
	s3: add_2bits port map (A => A(3), B => B(3), Cin => C(2), sum => sum(3), cout=> C(3));
	ovf  <= C(3) xor C(2);
	cout <= C(3);

	A <= SW(3 downto 0);
	B <= SW(7 downto 4);

	LEDR(3 downto 0) <= sum;
	LEDR(9)          <= ovf;
	LEDR(7)          <= cout;
end arch;  
