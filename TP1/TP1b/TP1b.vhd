library ieee;
use ieee.std_logic_1164.all;

entity TP1b is
	port (
		in_sig  : in  std_logic_vector(6 downto 0);
		out_sig : out std_logic_vector(6 downto 0)
	);
end TP1b;

architecture arch_main of TP1b is
	signal nombre, lettre: std_logic_vector(6 downto 0);
begin
	CV1: entity work.conv_un
		port map (
			in_sig  => in_sig(5 downto 3),
			out_sig => nombre
		);

	CV2: entity work.conv_deux
		port map (
			in_sig_d  => in_sig(2 downto 0),
			out_sig_d => lettre
		);

	MUX: entity work.mux
		port map (
			in_mux_1 => nombre,
			in_mux_2 => lettre,
			in_sel   => in_sig(6),
			out_mux  => out_sig
		);

end arch_main;
