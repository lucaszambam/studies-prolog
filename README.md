# Sistemas Especialistas em Prolog 📋

## Descrição
Este repositório contém **cinco sistemas especialistas** desenvolvidos em Prolog para diferentes domínios, como **diagnóstico médico, análise de problemas em veículos, recomendação de livros, treinos de academia** e **investigação criminal**. Cada sistema utiliza técnicas de **programação funcional** para tomada de decisões baseadas em regras e fatos definidos pelo usuário.

## Índice
- [Requisitos](#requisitos)
- [Configuração](#configuração)
- [Instruções de Execução](#instruções-de-execução)
- [Casos Implementados](#casos-implementados)
  - [1. Diagnóstico Médico](#1-diagnóstico-médico)
  - [2. Análise de Problemas de Veículos](#2-análise-de-problemas-de-veículos)
  - [3. Recomendações de Livros](#3-recomendações-de-livros)
  - [4. Recomendação de Treinos de Academia](#4-recomendação-de-treinos-de-academia)
  - [5. Análise de Investigação Criminal](#5-análise-de-investigação-criminal)

---

## Requisitos
- **SWI-Prolog** instalado (versão mais recente recomendada)
- Terminal ou prompt de comando

## Configuração
Clone o repositório em sua máquina local:
```bash
git clone https://github.com/lucaszambam/studies-prolog.git
cd studies-prolog
```

## Instruções de Execução
Para rodar qualquer um dos sistemas, siga estas etapas:

1. Abra o terminal e navegue até o diretório onde o arquivo Prolog está localizado.
2. Execute o comando para iniciar o SWI-Prolog:
   ```bash
   swipl -s nome_do_arquivo.pl
   ```
3. No prompt do Prolog, execute o predicado `executar.` para iniciar o sistema.
   ```prolog
   ?- executar.
   ```

---

## Casos Implementados

### 1. Diagnóstico Médico
**Objetivo**: Diagnosticar doenças comuns com base em sintomas relatados pelo usuário.

**Como funciona**:
- O sistema pergunta se o usuário tem determinados sintomas, como febre, dor de cabeça ou tosse.
- Com base nas respostas, sugere possíveis doenças.

**Exemplo de uso**:
```prolog
?- executar.
Bem-vindo ao sistema de diagnóstico médico!
Você tem febre? (s/n): s
Você tem dor de cabeça? (s/n): s
Você tem tosse? (s/n): n
Possível diagnóstico: enxaqueca
```

**Entradas**: Respostas "s" ou "n" para cada sintoma.
**Saída**: Diagnóstico sugerido com base nos sintomas.

---

### 2. Análise de Problemas de Veículos
**Objetivo**: Identificar problemas comuns em veículos e sugerir soluções.

**Como funciona**:
- O sistema pergunta sobre sintomas ou comportamentos do veículo, como "motor não liga" ou "barulho ao frear".
- Baseado nas respostas, sugere possíveis causas e soluções.

**Exemplo de uso**:
```prolog
?- executar.
O motor do carro não liga? (s/n): s
As luzes estão fracas? (s/n): s
Possível problema: bateria fraca
Solução sugerida: Verifique a bateria
```

**Entradas**: Respostas "s" ou "n" para cada sintoma.
**Saída**: Diagnóstico do problema e sugestões de solução.

---

### 3. Recomendações de Livros
**Objetivo**: Recomendar livros com base em preferências de gênero e interesses do usuário.

**Como funciona**:
- O sistema coleta informações sobre gêneros de interesse, como ficção, história ou autoajuda.
- Sugere livros específicos com base nas preferências informadas.

**Exemplo de uso**:
```prolog
?- executar.
Qual gênero você prefere? (ficcao/historia/ciencia/autoajuda): ficcao
Você se interessa por política? (s/n): s
Recomendação: "1984" - Uma obra clássica sobre um regime totalitário.
```

**Entradas**: Preferências de gênero e interesses.
**Saída**: Título do livro recomendado e uma breve sinopse.

---

### 4. Recomendação de Treinos de Academia
**Objetivo**: Sugerir treinos baseados em objetivos como ganhar massa muscular ou perder peso.

**Como funciona**:
- O sistema pergunta sobre o objetivo de treino, experiência e disponibilidade de tempo.
- Sugere treinos detalhados com séries e repetições.

**Exemplo de uso**:
```prolog
?- executar.
Qual o seu objetivo? (ganhar_massa/perder_peso/condicionamento): ganhar_massa
Qual sua experiência? (iniciante/intermediario/avancado): intermediario
Quantas horas por semana você pode treinar? (2-10): 5
Recomendação de treino: Hipertrofia - 4 séries de 12 repetições de supino.
```

**Entradas**: Objetivos e nível de experiência.
**Saída**: Plano de treino detalhado.

---

### 5. Análise de Investigação Criminal
**Objetivo**: Auxiliar na análise de casos criminais com base em evidências e testemunhos.

**Como funciona**:
- Coleta informações sobre evidências como impressões digitais, testemunhas e álibis.
- Sugere suspeitos ou teorias baseadas nas informações fornecidas.

**Exemplo de uso**:
```prolog
?- executar.
Foram encontradas impressões digitais no local do crime? (s/n): s
Existe um motivo financeiro ou pessoal? (financeiro/vinganca/nenhum): financeiro
Qual foi a arma usada no crime? (revolver/faca/nao_sabe): revolver
Suspeito identificado: Joao
Possível teoria do crime: assassinato planejado
```

**Entradas**: Informações sobre o caso.
**Saída**: Suspeitos e teorias sugeridas.

---

## Programação Funcional
Todos os sistemas utilizam conceitos de **programação funcional**, como:
- **Fatos**: Conhecimento previamente definido no sistema (e.g., sintomas, evidências).
- **Regras**: Relações lógicas que determinam o comportamento do sistema com base nos fatos.
- **Predicados**: Funções que fazem perguntas ao usuário e tomam decisões com base nas respostas.