% --- Desenvolvido por: Lucas Zambam ---
% Modulo: Recomendacoes de Livros em Prolog

% Base de dados de livros com generos e interesses
livro('1984', 'George Orwell', 'Um romance distopico que explora a vigilancia governamental e a opressao.', ficcao, politica).
livro('Sapiens', 'Yuval Noah Harari', 'Um mergulho na historia da humanidade, explorando ciencia, evolucao e sociedade.', historia, ciencia).
livro('O Pequeno Principe', 'Antoine de Saint-Exupery', 'Uma historia encantadora sobre amizade, amor e descobertas.', ficcao, filosofia).
livro('Mindset', 'Carol S. Dweck', 'Explora a psicologia do sucesso e a importancia de um mindset de crescimento.', autoajuda, psicologia).
livro('Fahrenheit 451', 'Ray Bradbury', 'Uma critica a censura e a ignorancia em uma sociedade distopica.', ficcao, liberdade).
livro('A Breve Historia do Tempo', 'Stephen Hawking', 'Explora o universo, desde o Big Bang ate buracos negros.', ciencia, astronomia).
livro('O Poder do Habito', 'Charles Duhigg', 'Investiga como os habitos funcionam e como podem ser mudados.', autoajuda, comportamento).
livro('A Arte da Guerra', 'Sun Tzu', 'Um classico sobre estrategia militar e lideranca.', estrategia, filosofia).
livro('Medicina dos Horrores', 'Lindsey Fitzharris', 'A origem da medicina moderna em meio a procedimentos brutais.', historia, medicina).

% Regras para recomendar livros com base no genero e interesse
recomendar(Titulo, Autor, Sinopse) :-
    livro(Titulo, Autor, Sinopse, Genero, Interesse),
    genero(Genero),
    interesse(Interesse).

% Predicados para perguntar ao usuario sobre seus interesses
perguntar_genero(Genero) :-
    format('Voce tem interesse no genero ~w? (s/n): ', [Genero]),
    read(Resposta),
    nl,
    (Resposta == s -> assert(genero(Genero)); fail).

perguntar_interesse(Interesse) :-
    format('Voce tem interesse no topico ~w? (s/n): ', [Interesse]),
    read(Resposta),
    nl,
    (Resposta == s -> assert(interesse(Interesse)); fail).

% Diagnostico final e recomendacao
diagnosticar :-
    format('\n--- Sistema de Recomendacao de Livros ---\n'),
    (recomendar(Titulo, Autor, Sinopse) ->
        format('Recomendacao de Livro:\nTitulo: ~w\nAutor: ~w\nSinopse: ~w\n\n', [Titulo, Autor, Sinopse]);
        writeln('Nao foi possivel encontrar um livro que se encaixe nas suas preferencias.')),
    limpar_preferencias.

% Predicados dinamicos para armazenar as respostas do usuario
:- dynamic genero/1, interesse/1.

% Funcao para limpar as preferencias apos o diagnostico
limpar_preferencias :-
    retractall(genero(_)),
    retractall(interesse(_)).

% Interacao inicial com o usuario
executar :-
    format('\nBem-vindo ao sistema de recomendacao de livros!\n\n'),
    perguntar_genero(ficcao),
    perguntar_genero(historia),
    perguntar_genero(ciencia),
    perguntar_genero(autoajuda),
    perguntar_genero(estrategia),
    perguntar_interesse(politica),
    perguntar_interesse(ciencia),
    perguntar_interesse(filosofia),
    perguntar_interesse(liberdade),
    perguntar_interesse(astronomia),
    perguntar_interesse(psicologia),
    perguntar_interesse(comportamento),
    perguntar_interesse(medicina),
    diagnosticar.
