-----------------------------------------------------------
-- Model of a simple testbench to simulate a D Flip-Flop --
-----------------------------------------------------------
-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- top-level entity
entity tb_tp2 is end entity;
 
-- architecture
architecture arc of tb_tp2 is
-- component declaration

component tp2 is
    port (rset, clkPadrao: in std_logic;
          HEX0, HEX1, HEX2, HEX3: out std_logic_vector (7 downto 0)
        );
end component;
 
constant PERIODO : time := 20 ns;
signal ENT_CLK : std_logic := '0'; -- deve ser inicializado
signal ENT_CLK_ENABLE: std_logic := '1'; -- Sinal de Enable do clock só para efeito de controle do fim da simulação
signal ENT_R : std_logic;
 
begin
    -- geração do clock com periodo PERIODO
    ENT_CLK <= ENT_CLK_ENABLE and not ENT_CLK after PERIODO/2;
    ENT_CLK_ENABLE <= '1', '0' after 20*PERIODO; -- a simulação termina após transcorrer 20 períodos de clock.
 
    -- instanciação do DUT, que nesse exemplo é um ffd
    DUT : tp2 port map(clkPadrao => ENT_CLK, rset => ENT_R);
    -- a partir daqui declaro os estímulos de entrada, ou a injecao de sinais
    -- um process para o reset
    reset: process
    begin
        ENT_R <= '1';
        wait for 2*PERIODO; -- um reset de duração de 2 períodos de clock
        ENT_R <= '0';
        wait;
    end process reset;
end architecture;