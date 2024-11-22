library ieee;
use ieee.std_logic_1164.all;

entity conv_deux is
	port (
		in_sig_d: in std_logic_vector(2 downto 0);
		out_sig_d: out std_logic_vector(6 downto 0)
	);
end conv_deux;

architecture arch_deux of conv_deux is
begin
	process(in_sig_d) is
		begin
			case in_sig_d is
				when "000"  => out_sig_d <= "0001000";
				when "001"  => out_sig_d <= "0000011";
				when "010"  => out_sig_d <= "1000110";
				when "011"  => out_sig_d <= "0100001";
				when "100"  => out_sig_d <= "0000110";
				when "101"  => out_sig_d <= "0001110";
				when "110"  => out_sig_d <= "0010000";
				when others => out_sig_d <= "0001001";
			end case;
	end process;
end arch_deux;
