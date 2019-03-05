library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity my_alu is
    port(
        a,b,opcode : in std_logic_vector(3 downto 0);
        output     : out std_logic_vector(3 downto 0)
    );
end my_alu;

architecture Behavioral of my_alu is
    
begin
    process begin
        
        case opcode is 
            when "0000" => output <= std_logic_vector(unsigned(a)+unsigned(b));
            when "0001" => output <= std_logic_vector(unsigned(a)-unsigned(b));
            when "0010" => output <= std_logic_vector(unsigned(a)+1);
            when "0011" => output <= a;
            when "0100" => output <= std_logic_vector(0-unsigned(a));
            when "0101" => 
                if (a>b) then
                    output <= "0001";
                else
                    output <= "0000";
                end if;
            when "0110" => output <= a(2 downto 0) & "0";
            when "0111" => output <= "0" & a(3 downto 1);
            when "1000" => output <= "0" & a(3 downto 1);
            when "1001" => output <= not a;
            when "1010" => output <= a and b;
            when "1011" => output <= a or b;
            when "1100" => output <= a xor b;
            when "1101" => output <= a xnor b;
            when "1110" => output <= a nand b;
            when "1111" => output <= a nor b;
        end case;
        
    end process;

end Behavioral;
