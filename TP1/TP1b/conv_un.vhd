library ieee;
use ieee.std_logic_1164.all;

entity conv_un is
	port (
		in_sig  : in  std_logic_vector(2 downto 0);
		out_sig : out std_logic_vector(6 downto 0)
	);
end conv_un;

architecture arch_un of conv_un is
begin
	process(in_sig) is
		begin
			case in_sig is
				when "000"  => out_sig <= "1000000";
				when "001"  => out_sig <= "1111001";
				when "010"  => out_sig <= "0100100";
				when "011"  => out_sig <= "0110000";
				when "100"  => out_sig <= "0011001";
				when "101"  => out_sig <= "0010010";
				when "110"  => out_sig <= "0000010";
				when others => out_sig <= "1111000";
			end case;
	end process;
end arch_un;
