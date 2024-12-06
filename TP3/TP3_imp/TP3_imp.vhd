library ieee;
use ieee.std_logic_1164.all;

entity TP3_imp is
	port (
		KEY      : in  std_logic_vector(3 downto 0);
		clock_50 : in  std_logic;
		LEDR     : out std_logic_vector(9 downto 0)
	);
end TP3_imp;

architecture arch of TP3_imp is
	type state_type is (VnsReo, JnsReo, RnsReo1, RnsVeo, RnsJeo, RnsReo2);
	signal state: state_type;
	signal reset, clk : std_logic;
	signal lights : std_logic_vector(5 downto 0);
begin

	reset <= KEY(0);
	clk <= clock_50;

	process(reset, clk) is
		variable num_cycles: integer range 0 to 750000000 := 0;
	begin
		if (reset = '0') then
			state <= VnsReo;
		else
			if rising_edge(clk) then
				num_cycles := num_cycles + 1;

				case state is
					when VnsReo =>
						if num_cycles = 750000000 then
							num_cycles := 0;
							state <= JnsReo;
						end if;

					when JnsReo =>
						if num_cycles = 150000000 then
							num_cycles := 0;
							state <= RnsReo1;
						end if;

					when RnsReo1 =>
						if num_cycles = 150000000 then
							num_cycles := 0;
							state <= RnsVeo;
						end if;

					when RnsVeo =>
						if num_cycles = 750000000 then
							num_cycles := 0;
							state <= RnsJeo;
						end if;

					when RnsJeo =>
						if num_cycles = 150000000 then
							num_cycles := 0;
							state <= RnsReo2;
						end if;

					when RnsReo2 =>
						if num_cycles = 150000000 then
							num_cycles := 0;
							state <= VnsReo;
						end if;

				end case;
			end if;
		end if;
	end process;

	process(state) is
	begin
		case state is
			when VnsReo  => lights <= "001100";
			when JnsReo  => lights <= "010100";
			when RnsReo1 => lights <= "100100";
			when RnsVeo  => lights <= "100001";
			when RnsJeo  => lights <= "100010";
			when RnsReo2 => lights <= "100100";
		end case;
	end process;

	LEDR(9) <= lights(5);
	LEDR(8) <= lights(4);
	LEDR(7) <= lights(3);
	LEDR(2) <= lights(2);
	LEDR(1) <= lights(1);
	LEDR(0) <= lights(0);

end arch;
