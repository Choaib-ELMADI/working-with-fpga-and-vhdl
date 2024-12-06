library ieee;
use ieee.std_logic_1164.all;

entity TP3_sim is
	port (
		reset, clk : in  std_logic;
		lights     : out std_logic_vector(5 downto 0)
	);
end TP3_sim;

architecture arch of TP3_sim is
	type state_type is (VnsReo, JnsReo, RnsReo1, RnsVeo, RnsJeo, RnsReo2);
	signal state: state_type;
begin

	process(reset, clk) is
		variable num_cycles: integer range 0 to 15 := 0;
	begin
		if (reset = '1') then
			state <= VnsReo;
		else
			if rising_edge(clk) then
				num_cycles := num_cycles + 1;

				case state is
					when VnsReo =>
						if num_cycles = 15 then
							num_cycles := 0;
							state <= JnsReo;
						end if;

					when JnsReo =>
						if num_cycles = 3 then
							num_cycles := 0;
							state <= RnsReo1;
						end if;

					when RnsReo1 =>
						if num_cycles = 3 then
							num_cycles := 0;
							state <= RnsVeo;
						end if;

					when RnsVeo =>
						if num_cycles = 15 then
							num_cycles := 0;
							state <= RnsJeo;
						end if;

					when RnsJeo =>
						if num_cycles = 3 then
							num_cycles := 0;
							state <= RnsReo2;
						end if;

					when RnsReo2 =>
						if num_cycles = 3 then
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

end arch;
