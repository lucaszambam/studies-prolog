% --- Desenvolvido por: Lucas Zambam ---
% Modulo: Recomendacoes de Treino em Prolog

% Base de dados de treinos com detalhes de series, repeticoes e instrucoes
treino('Hipertrofia', 'Treino focado em ganho de massa muscular', [
    exercicio('Supino Reto', 4, 10, 'Mantenha os pes firmes no chao e controle o movimento.'),
    exercicio('Agachamento Livre', 4, 12, 'Mantenha a coluna ereta e os joelhos alinhados.'),
    exercicio('Rosca Direta', 3, 15, 'Evite balancar o corpo para concentrar a forca no biceps.')
]).
treino('Perda de Peso', 'Treino para emagrecimento e queima de gordura', [
    exercicio('Corrida Intervalada', 4, 3, 'Alterne 1 min de corrida rapida com 1 min de caminhada.'),
    exercicio('Burpees', 3, 12, 'Mantenha o ritmo acelerado para queimar mais calorias.'),
    exercicio('Abdominais', 4, 15, 'Controle a respiracao ao contrair o abdomen.')
]).
treino('Condicionamento Fisico', 'Treino para melhorar o cardio e a resistencia', [
    exercicio('Pular Corda', 5, 2, 'Mantenha os cotovelos proximos ao corpo e pule de forma continua.'),
    exercicio('Remada Sentada', 3, 12, 'Puxe com os ombros e mantenha a postura ereta.'),
    exercicio('Flexao de Bracos', 4, 10, 'Mantenha o corpo reto durante o movimento.')
]).

% Regras para recomendar treinos com base no objetivo, experiencia e disponibilidade
recomendar_treino('Hipertrofia') :-
    objetivo(ganhar_massa),
    experiencia(intermediario).
recomendar_treino('Perda de Peso') :-
    objetivo(emagrecer),
    disponibilidade(tempo_limitado).
recomendar_treino('Condicionamento Fisico') :-
    objetivo(melhorar_condicionamento),
    experiencia(iniciante).

% Perguntas ao usuario para coletar informacoes sobre seu objetivo, experiencia e tempo
perguntar_objetivo :-
    writeln('Qual e o seu objetivo principal? (ganhar_massa/emagrecer/melhorar_condicionamento):'),
    read(Resposta),
    nl,
    assert(objetivo(Resposta)).

perguntar_experiencia :-
    writeln('Qual e o seu nivel de experiencia na academia? (iniciante/intermediario/avancado):'),
    read(Resposta),
    nl,
    assert(experiencia(Resposta)).

perguntar_tempo :-
    writeln('Quanto tempo voce tem disponivel por treino? (tempo_limitado/tempo_suficiente):'),
    read(Resposta),
    nl,
    assert(disponibilidade(Resposta)).

% Funcao para diagnostico e recomendacao de treino
diagnosticar :-
    format('\n--- Sistema de Recomendacao de Treinos ---\n'),
    (recomendar_treino(Treino) ->
        treino(Treino, Descricao, Exercicios),
        format('Plano de Treino: ~w\nDescricao: ~w\n', [Treino, Descricao]),
        listar_exercicios(Exercicios);
        writeln('Nao foi possivel encontrar um treino que se encaixe nas suas preferencias.')),
    limpar_preferencias.

% Funcao para listar os exercicios do treino recomendado
listar_exercicios([]).
listar_exercicios([exercicio(Nome, Series, Repeticoes, Instrucoes)|Resto]) :-
    format('\nExercicio: ~w\nSeries: ~w\nRepeticoes: ~w\nInstrucoes: ~w\n', [Nome, Series, Repeticoes, Instrucoes]),
    listar_exercicios(Resto).

% Predicados dinamicos para armazenar as respostas do usuario
:- dynamic objetivo/1, experiencia/1, disponibilidade/1.

% Funcao para limpar as preferencias apos a recomendacao
limpar_preferencias :-
    retractall(objetivo(_)),
    retractall(experiencia(_)),
    retractall(disponibilidade(_)).

% Interacao inicial com o usuario
executar :-
    format('\nBem-vindo ao sistema de recomendacao de treinos!\n\n'),
    perguntar_objetivo,
    perguntar_experiencia,
    perguntar_tempo,
    diagnosticar.
