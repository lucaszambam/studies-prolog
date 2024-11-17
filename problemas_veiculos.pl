% --- Desenvolvido por: Lucas Zambam ---
% Modulo: Analise de Problemas de Veiculos em Prolog

% Sintomas comuns no sistema de diagnostico de veiculos
sintoma(motor_nao_liga).
sintoma(barulho_ao_frear).
sintoma(vazamento_oleo).
sintoma(luzes_fracas).
sintoma(pedal_freio_macio).

% Problemas e suas possiveis causas
problema(bateria_fraca) :- motor_nao_liga, luzes_fracas.
problema(freio_desgastado) :- barulho_ao_frear, pedal_freio_macio.
problema(sistema_oleo) :- vazamento_oleo.

% Solucoes recomendadas para problemas
solucao(bateria_fraca) :- writeln('Verifique a bateria e o alternador.').
solucao(freio_desgastado) :- writeln('Verifique o sistema de freios e as pastilhas.').
solucao(sistema_oleo) :- writeln('Verifique o nivel de oleo e se ha vazamentos.').

% Recomendacoes de seguranca para problemas graves
conselho_grave :- writeln('Problema grave! Leve o carro a um mecanico imediatamente.').

% Perguntar ao usuario sobre sintomas
perguntar(Sintoma) :-
    format('O seu carro apresenta o sintoma ~w? (s/n): ', [Sintoma]),
    read(Resposta),
    nl,
    (Resposta == s -> assert(Sintoma); fail).

% Diagnostico baseado nos sintomas informados
diagnosticar :-
    format('\n--- Diagnostico de Problemas de Veiculo ---\n'),
    (problema(Problema) ->
        format('Problema detectado: ~w\n', [Problema]),
        solucao(Problema);
        writeln('Nao foi possivel identificar o problema. Consulte um mecanico.')),
    limpar_sintomas.

% Predicados para definir sintomas como fatos dinamicamente
:- dynamic motor_nao_liga/0, barulho_ao_frear/0, vazamento_oleo/0.
:- dynamic luzes_fracas/0, pedal_freio_macio/0.

% Funcao para limpar os sintomas apos o diagnostico
limpar_sintomas :-
    retractall(motor_nao_liga), retractall(barulho_ao_frear), retractall(vazamento_oleo),
    retractall(luzes_fracas), retractall(pedal_freio_macio).

% Interacao com o usuario para coletar sintomas
executar :-
    format('\nBem-vindo ao sistema de diagnostico de problemas de veiculos!\n\n'),
    perguntar(motor_nao_liga),
    perguntar(barulho_ao_frear),
    perguntar(vazamento_oleo),
    perguntar(luzes_fracas),
    perguntar(pedal_freio_macio),
    diagnosticar.
