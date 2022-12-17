library IEEE;
use IEEE.std_logic_1164.all;

-- entity
entity tp2 is
  port (rset, clkPadrao: in std_logic;
        HEX0, HEX1, HEX2, HEX3: out std_logic_vector (7 downto 0)
    );
end tp2;

-- architecture
architecture hardware of tp2 is
    component divisor_clock is
        port (clk50MHz : in std_logic;
                 reset : in std_logic;
                clk1Hz : out std_logic);
    end component;

  type state_type is (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T); -- A-01 B-10 C-11 ...
  signal PS, NS: state_type;
  signal clk: std_logic;

begin
  x1 : divisor_clock port map(clk50MHz =>clkPadrao, reset=>rset, clk1Hz=>clk);
  sync_proc : process (clk, rset)
  begin
    if (rset = '1') then
        PS <= A;
    elsif (RISING_EDGE(clk)) then
        PS <= NS;
    end if;
  end process sync_proc;

  comb_proc : process (clk)
  begin
    case PS is
      when A =>  
        NS <=B;
        HEX0 <= "10011001";--Y
        HEX1 <= "10000110";--E
        HEX2 <= "11000111";--L
        HEX3 <= "11000110";--C
      when B =>
        NS <=C;
        HEX0 <= "10000111";--t
        HEX1 <= "10011001";--Y
        HEX2 <= "10000110";--E
        HEX3 <= "11000111";--L
      when C =>
        NS <=D;
        HEX0 <= "11000000";--O
        HEX1 <= "10000111";--t
        HEX2 <= "10011001";--Y
        HEX3 <= "10000110";--E
      when D =>
        NS <=E;
        HEX0 <= "00101011";--n.
        HEX1 <= "11000000";--O
        HEX2 <= "10000111";--t
        HEX3 <= "10011001";--Y
      when E =>
        NS <=F;
        HEX0 <= "10001110";--F
        HEX1 <= "00101011";--n.
        HEX2 <= "11000000";--O
        HEX3 <= "10000111";--t
      when F =>
        NS <=G;
        HEX0 <= "10000110";--E
        HEX1 <= "10001110";--F
        HEX2 <= "00101011";--n.
        HEX3 <= "11000000";--O
      when G =>
        NS <=H;
        HEX0 <= "11000111";--L
        HEX1 <= "10000110";--E
        HEX2 <= "10001110";--F
        HEX3 <= "00101011";--n.
      when H =>
        NS <=I;
        HEX0 <= "11001111";--I
        HEX1 <= "11000111";--L
        HEX2 <= "10000110";--E
        HEX3 <= "10001110";--F
      when I =>
        NS <=J;
        HEX0 <= "10001100";--P
        HEX1 <= "11001111";--I
        HEX2 <= "11000111";--L
        HEX3 <= "10000110";--E
      when J =>
        NS <=K;
        HEX0 <= "10001100";--P
        HEX1 <= "10001100";--P
        HEX2 <= "11001111";--I
        HEX3 <= "11000111";--L
      when K =>
        NS <=L;
        HEX0 <= "00000110";--E.
        HEX1 <= "10001100";--P
        HEX2 <= "10001100";--P
        HEX3 <= "11001111";--I
      when L =>
        NS <=M;
        HEX0 <= "10000111";--t
        HEX1 <= "00000110";--E.
        HEX2 <= "10001100";--P
        HEX3 <= "10001100";--P
      when M =>
        NS <=N;
        HEX0 <= "10001001";--H
        HEX1 <= "10000111";--t
        HEX2 <= "00000110";--E.
        HEX3 <= "10001100";--P
      when N =>
        NS <=O;
        HEX0 <= "11001111";--I
        HEX1 <= "10001001";--H
        HEX2 <= "10000111";--t
        HEX3 <= "00000110";--E.
      when O =>
        NS <=P;
        HEX0 <= "10001000";--A
        HEX1 <= "11001111";--I
        HEX2 <= "10001001";--H
        HEX3 <= "10000111";--t
      when P =>
        NS <=Q;
        HEX0 <= "10000010";--G
        HEX1 <= "10001000";--A
        HEX2 <= "11001111";--I
        HEX3 <= "10001001";--H

      when Q =>
        NS <=R;
        HEX0 <= "01000000";--O.
        HEX1 <= "10000010";--G
        HEX2 <= "10001000";--A
        HEX3 <= "11001111";--I

      when R =>
        NS <=S;
        HEX0 <= "11000110";--C
        HEX1 <= "01000000";--O.
        HEX2 <= "10000010";--G
        HEX3 <= "10001000";--A

      when S =>
        NS <=A;
        HEX0 <= "11000111";--L
        HEX1 <= "11000110";--C
        HEX2 <= "01000000";--O.
        HEX3 <= "10000010";--G

      when others =>
        NS <=A;
        HEX0 <= "10000110";--E
        HEX1 <= "11000111";--L
        HEX2 <= "11000110";--C
        HEX3 <= "01000000";--O.
    end case;
  end process comb_proc;
end hardware;