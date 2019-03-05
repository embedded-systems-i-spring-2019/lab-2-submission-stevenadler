library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ripple_adder_tb is
end ripple_adder_tb;

architecture Behavioral of ripple_adder_tb is
    component ripple_adder
        port(
            A,B : in std_logic_vector(3 downto 0);
            Cin : in std_logic;
            S   : out std_logic_vector(3 downto 0);
            Cout: out std_logic
        );
    end component;
    
    signal A_tb   : std_logic_vector(3 downto 0) := (others => '0');
    signal B_tb   : std_logic_vector(3 downto 0) := (others => '0');
    signal S_tb   : std_logic_vector(3 downto 0) := (others => '0');
    signal Cin_tb : std_logic := '0';
    signal Cout_tb : std_logic := '0';

begin
    tb: ripple_adder port map (A=>A_tb, B=>B_tb, S=>S_tb, Cin=>Cin_tb, Cout=>Cout_tb);
    process begin
        A_tb <= "0010";
        B_tb <= "1000";
        Cin_tb <= '1';
        wait for 5 ms;
        B_tb <= "1011";
        wait for 5 ms;
        A_tb <= "0001";
        B_tb <= "0011";
        Cin_tb <= '0';
        wait for 5 ms;
        A_tb <= "1001";
        B_tb <= "1011";
        Cin_tb <= '1';
        wait for 5 ms;
    end process;
end Behavioral;
