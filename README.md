# Letreiro em VHDL

Enunciado do Trabalho 2 da Guia 12 de LSD para todos os grupos:

>Escrever em VHDL um código sintetizável (DUT) de uma Máquina de Estados Finitos (FSM) com uma entrada de RESET síncrona e no mínimo 20 estados diferentes que devem se repetir ciclicamente a cada 10 segundos. Cada estado deve apresentar um padrão de acender/desligar em um ou mais leds usando todos os 4 displays de 7 segmentos do kit DE10-Lite. Use como clock de entrada para a sua FSM a saída do código: "divisor_clock.vhd", que se encontra na pasta "Scripts e exemplos de codigos". Faça as adaptações que vocês julgarem necessárias no código disponibilizado. Escreva um testbench em VHDL para testar a funcionalidade do seu código sintetizável (seu DUT). Por fim, crie um projeto dentro do Quartus II e sintetize o DUT que você testou com o GHDL. Use como recursos do kit para definir a entrada de RESET e de clock, e como saídas, os 4 displays de 7 segmentos do kit. Faça o arquivo de associação de pinos do FPGA com as entradas e saídas da entidade do seu DUT (pin assignments). Gere o código binário (compile) de dentro do Quartus II para ser gravado no FPGA do kit DE10-Lite. Grave o FPGA com o seu DUT, teste o funcionamento do mesmo e apresente tudo ao professor no dia da aula marcada para a apresentação do trabalho 2.
