library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ripple_adder is
    port(
        A,B : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        S   : out std_logic_vector(3 downto 0);
        Cout: out std_logic
    );
end ripple_adder;

architecture Behavioral of ripple_adder is

    component adder is 
        port(
            A,B,Cin : in std_logic;
            S,Cout  : out std_logic
        );
    end component;
    
    signal c0 : std_logic := '0';
    signal c1 : std_logic := '0';
    signal c2 : std_logic := '0';
    
begin
    a1: adder
        port map( A => A(0),
                  B => B(0),
                  Cin => Cin,
                  Cout => C0,
                  S => S(0));
    a2: adder
        port map( A => A(1),
                  B => B(1),
                  Cin => C0,
                  Cout => C1,
                  S => S(1));
    a3: adder
        port map( A => A(2),
                  B => B(2),
                  Cin => C1,
                  Cout => C2,
                  S => S(2));              
    a4: adder
        port map( A => A(3),
                  B => B(3),
                  Cin => C2,
                  Cout => Cout,
                  S => S(3));
                  
end Behavioral;
