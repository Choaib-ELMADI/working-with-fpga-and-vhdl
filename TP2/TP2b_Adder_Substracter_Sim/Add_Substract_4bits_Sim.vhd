library ieee;
use ieee.std_logic_1164.all;

entity Add_Substract_4bits_Sim is
	port (
		A, B      : in  std_logic_vector(3 downto 0);
		op        : in  std_logic;
		res       : out std_logic_vector(3 downto 0);
		cout, ovf : out std_logic
	);
end Add_Substract_4bits_Sim;

architecture arch of Add_Substract_4bits_Sim is

	component add_2bits is
		port (
			A, B, Cin : in  std_logic;
			sum       : out std_logic;
			cout      : out std_logic
		);
	end component;

	signal C  : std_logic_vector(3 downto 0);
	signal nB : std_logic_vector(3 downto 0);

begin

	nB <= (op & op & op & op) xor B;

	r0: add_2bits port map (A => A(0), B => nB(0), Cin => op,   sum => res(0), cout => C(0));
	r1: add_2bits port map (A => A(1), B => nB(1), Cin => C(0), sum => res(1), cout => C(1));
	r2: add_2bits port map (A => A(2), B => nB(2), Cin => C(1), sum => res(2), cout => C(2));
	r3: add_2bits port map (A => A(3), B => nB(3), Cin => C(2), sum => res(3), cout => C(3));
	ovf <= C(3) xor C(2);
	cout<= C(3);

end arch;
