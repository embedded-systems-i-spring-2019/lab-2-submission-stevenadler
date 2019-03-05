library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity alu_tester is
    port(
        btn,sw : in std_logic_vector(3 downto 0);
        clk    : in std_logic;
        led    : out std_logic_vector(3 downto 0)
    );
end alu_tester;

architecture Behavioral of alu_tester is

    component my_alu is
        port(
            a,b,opcode : in std_logic_vector(3 downto 0);
            output     : out std_logic_vector(3 downto 0)
        );
    end component;
    
    component debounce is
        port(
            clk     : in  std_logic;  
            btn  	: in  std_logic;  
            dbnc 	: out std_logic   
        ); 
    end component;
    
    signal a_val      : std_logic_vector(3 downto 0) := (others => '0');
    signal b_val      : std_logic_vector(3 downto 0) := (others => '0');
    signal opcode_val : std_logic_vector(3 downto 0) := (others => '0');
    signal output_val : std_logic_vector(3 downto 0) := (others => '0');
    signal dbnc_0  : std_logic := '0'; 
    signal dbnc_1  : std_logic := '0'; 
    signal dbnc_2  : std_logic := '0'; 
    signal dbnc_3  : std_logic := '0'; 
    
begin         
    process (clk) 
    begin
         if rising_edge(clk) then
            if dbnc_3 = '1' then
                a_val <= "0000";
                b_val <= "0000";
                opcode_val <= "0000";
            else
                if dbnc_2 = '1' then
                    opcode_val <= sw;
                end if;
                if dbnc_1 = '1' then
                    a_val <= sw;
                end if;
                if dbnc_0 = '1' then
                    b_val <= sw;
                end if;
            end if;
            led <= output_val;
         end if;
    end process;
    
alu: my_alu
    port map ( a => a_val,
               b => b_val,
               opcode => opcode_val,
               output => output_val);
u1: debounce
    port map ( clk => clk,
               btn => btn(0),
               dbnc => dbnc_0);
u2: debounce
    port map ( clk => clk,
               btn => btn(1),
               dbnc => dbnc_1);
u3: debounce
    port map ( clk => clk,
               btn => btn(2),
               dbnc => dbnc_2);
u4: debounce
    port map ( clk => clk,
               btn => btn(3),
               dbnc => dbnc_3);
end Behavioral;




