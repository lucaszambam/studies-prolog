% --- Desenvolvido por: Lucas Zambam ---
% Modulo: Diagnostico Medico em Prolog

% Sintomas conhecidos no sistema
sintoma(febre).
sintoma(dor_de_cabeca).
sintoma(tosse).
sintoma(tosse_seca).
sintoma(dor_muscular).
sintoma(dor_de_garganta).
sintoma(sensibilidade_a_luz).
sintoma(nausea).
sintoma(coriza).
sintoma(espirros).

% Regras para diagnostico de doencas
doenca(gripe) :-
    febre, dor_de_cabeca, dor_muscular, tosse.
doenca(resfriado) :-
    coriza, espirros, dor_de_garganta.
doenca(enxaqueca) :-
    dor_de_cabeca, sensibilidade_a_luz, nausea.
doenca(covid) :-
    febre, tosse_seca, dor_muscular, perda_olfato_paladar.

% Perguntar ao usuario sobre sintomas
perguntar(Sintoma) :-
    format('Voce tem ~w? (s/n): ', [Sintoma]),
    read(Resposta),
    nl,
    (Resposta == s -> assert(Sintoma); true). % Se resposta for 's', o sintoma é registrado

% Diagnostico baseado nos sintomas informados
diagnosticar :-
    format('\n--- Sistema de Diagnostico Medico ---\n'),
    (doenca(Doenca) ->
        format('Possivel diagnostico: ~w\n', [Doenca]);
        writeln('Nao foi possivel identificar a doenca. Consulte um medico.')),
    limpar_sintomas.

% Predicados para definir sintomas como fatos dinamicamente
:- dynamic febre/0, dor_de_cabeca/0, tosse/0, tosse_seca/0.
:- dynamic dor_muscular/0, dor_de_garganta/0, sensibilidade_a_luz/0.
:- dynamic nausea/0, coriza/0, espirros/0.

% Funcao para limpar os sintomas apos o diagnostico
limpar_sintomas :-
    retractall(febre), retractall(dor_de_cabeca), retractall(tosse),
    retractall(tosse_seca), retractall(dor_muscular), retractall(dor_de_garganta),
    retractall(sensibilidade_a_luz), retractall(nausea), retractall(coriza),
    retractall(espirros).

% Interacao com o usuario para coletar sintomas
executar :-
    format('\nBem-vindo ao sistema de diagnostico medico!\n\n'),
    perguntar(febre),
    perguntar(dor_de_cabeca),
    perguntar(tosse),
    perguntar(tosse_seca),
    perguntar(dor_muscular),
    perguntar(dor_de_garganta),
    perguntar(sensibilidade_a_luz),
    perguntar(nausea),
    perguntar(coriza),
    perguntar(espirros),
    diagnosticar. % Realiza o diagnostico após todas as perguntas
