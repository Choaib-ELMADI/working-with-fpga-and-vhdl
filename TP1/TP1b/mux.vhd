library ieee;
use ieee.std_logic_1164.all;

entity mux is
	port (
		in_mux_1: in  std_logic_vector(6 downto 0);
		in_mux_2: in  std_logic_vector(6 downto 0);
		in_sel:   in  std_logic;
		out_mux:  out std_logic_vector(6 downto 0)
	);
end mux;

architecture arch_mux of mux is
begin
	process(in_mux_1, in_mux_2, in_sel)
	begin
		if in_sel = '1' then
			out_mux <= in_mux_1;
		else
			out_mux <= in_mux_2;
		end if;
	end process;
end arch_mux;
