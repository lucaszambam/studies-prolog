% --- Desenvolvido por: Lucas Zambam ---
% Modulo: Analise de Investigacao Criminal em Prolog

% Base de dados de evidencias e testemunhos
evidencia(impressao_digital).
evidencia(motivo).
evidencia(arma_do_crime).
evidencia(testemunha).
evidencia(alibi).

% Regras para identificar suspeitos com base nas evidencias coletadas
suspeito('Joao') :-
    impressao_digital(lugar_crime), motivo(financeiro).
suspeito('Maria') :-
    testemunha(viu_discutindo), relacao(intima).
suspeito('Carlos') :-
    arma_do_crime(revolver), alibi(nao_confirmado).
suspeito('Ana') :-
    motivo(vinganca), testemunha(viu_perto_da_vitima).

% Regras para formular teorias do crime com base nas evidencias
teoria(crime_passional) :-
    testemunha(viu_discutindo), relacao(intima).
teoria(roubo_mal_sucedido) :-
    motivo(financeiro), arma_do_crime(faca).
teoria(assassinato_planejado) :-
    impressao_digital(objeto_suspeito), alibi(nao_confirmado).
teoria(vinganca) :-
    motivo(vinganca), testemunha(viu_no_local).

% Perguntas para coletar informacoes do usuario sobre o caso
perguntar_impressao_digital :-
    writeln('Foram encontradas impressoes digitais no local do crime? (s/n):'),
    read(Resposta),
    nl,
    (Resposta == s -> assert(impressao_digital(lugar_crime)); true).

perguntar_motivo :-
    writeln('Existe um motivo financeiro ou pessoal? (financeiro/vinganca/nenhum):'),
    read(Resposta),
    nl,
    (Resposta \= nenhum -> assert(motivo(Resposta)); true).

perguntar_arma :-
    writeln('Qual foi a arma usada no crime? (revolver/faca/nao_sabe):'),
    read(Resposta),
    nl,
    (Resposta \= nao_sabe -> assert(arma_do_crime(Resposta)); true).

perguntar_testemunha :-
    writeln('Houve testemunhas que viram algo suspeito? (visto_discutindo/visto_perto/nenhum):'),
    read(Resposta),
    nl,
    (Resposta \= nenhum -> assert(testemunha(Resposta)); true).

perguntar_alibi :-
    writeln('O suspeito tem um alibi confirmado? (sim/nao):'),
    read(Resposta),
    nl,
    (Resposta == nao -> assert(alibi(nao_confirmado)); true).

% Funcao para analise do caso e recomendacao de suspeitos ou teorias
analisar :-
    format('\n--- Sistema de Analise de Investigacao Criminal ---\n'),
    (suspeito(Suspeito) ->
        format('Suspeito identificado: ~w\n', [Suspeito]);
        writeln('Nenhum suspeito identificado com as informacoes fornecidas.')),
    (teoria(Teoria) ->
        format('Possivel teoria do crime: ~w\n', [Teoria]);
        writeln('Nenhuma teoria encontrada para o caso.')),
    limpar_dados.

% Predicados dinamicos para armazenar as respostas do usuario
:- dynamic impressao_digital/1, motivo/1, arma_do_crime/1, testemunha/1, alibi/1, relacao/1.

% Funcao para limpar as informacoes apos a analise
limpar_dados :-
    retractall(impressao_digital(_)),
    retractall(motivo(_)),
    retractall(arma_do_crime(_)),
    retractall(testemunha(_)),
    retractall(alibi(_)),
    retractall(relacao(_)).

% Interacao inicial com o usuario para coletar dados
executar :-
    format('\nBem-vindo ao sistema de investigacao criminal!\n\n'),
    perguntar_impressao_digital,
    perguntar_motivo,
    perguntar_arma,
    perguntar_testemunha,
    perguntar_alibi,
    analisar.
