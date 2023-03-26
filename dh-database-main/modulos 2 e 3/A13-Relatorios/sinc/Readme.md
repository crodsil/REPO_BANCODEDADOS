# Readme

Exercício para prática de consultas de **agrupamento**, **conversão** e **formatação ** da aula síncrona de <u>25 de junho de 2021</u>.



Na base de dados **musimundos.mysql** faça as seguintes operações:



**Na tabela faturas:**

1 - O valor da fatura mais alta cujo a cidade de cobrança é “Oslo”. (MAX)

2 - O valor da fatura mais baixa de todas. (MIN)
3 - O valor médio das faturas que o país de cobrança é “Canada”.(AVG)
4 - A quantidade de faturas que o país de cobrança é “Canada”. (COUNT)
5 - O valor total somado de todas as faturas. (SUM)
6 - Selecione o id, a data e valor das faturas com valor abaixo da média. (Subqueries e AVG)

**Na tabela empregados:**

7 - A data de nascimento do funcionário mais jovem da empresa (MAX)
8 - A data de nascimento do funcionário mais velho da empresa (MIN)
9 - Formate a data do nascimento dos funcionários no formato ex: "02 May 2020"(DATE_FORMAT)

**Na tabela cancoes:** 

10 - O numero de cancoes que tem como compositor “AC/DC”. (COUNT) 
11 - A duração média das músicas em milisegundos (AVG)
12 - O tamanho médio em bytes das músicas que como compositor “AC/DC”. (AVG)

**Na tabela clientes:**

13 - Quantidade de clientes que moram na cidade de “São Paulo”(COUNT)
14 - Quantidade de clientes que moram na cidade “Paris” (COUNT)
15 - Quantidade de clientes que tenham email do “yahoo” (COUNT e LIKE)