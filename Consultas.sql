USE mercado;

--  Selecione o nome dos produtos que estão nas prateleiras com espaço maior que 11 
SELECT P.nome FROM PRODUTO AS P
WHERE EXISTS 
(SELECT * FROM PRATELEIRA PA 
	WHERE PA.espaco >11
	AND PA.numero_prateleira = P.numero_prateleira);
    
-- Seleciona o nome do produto com mais desconto de cada cliente, mostrando também o nome do cliente
SELECT  C.nome, P.nome
FROM PRODUTO AS P, CLIENTE  AS C, CLIENTE_PRODUTO  AS CP 
WHERE P.cod_barras =CP.cod_barras AND  C.cpf = CP.cpf 
AND  CP.desconto  = (SELECT MAX(CP2.desconto) FROM CLIENTE_PRODUTO  AS CP2 WHERE CP2.cpf = C.cpf);

-- Seleciona o nome e a sigla dos produtos que utilizam a unidade de medida Litros(id=10).
SELECT P.nome, U.sigla FROM PRODUTO AS P, UNIDADE_MEDIDA AS U
WHERE P.id = 10 AND U.sigla = (SELECT U2.sigla a FROM  UNIDADE_MEDIDA AS U2 WHERE U2.id = P.id);

-- Seleciona o nome dos funcionários com dependentes menores de 18 anos
SELECT F.nome FROM FUNCIONARIO AS F
WHERE EXISTS(SELECT * FROM DEPENDENTE AS D WHERE D.idade < 18 AND D.id = F.id);

-- Seleciona o "numero_prateleira" das prateleiras da SECAO com localizacao "Corredor 1, primeiro andar"
SELECT P.numero_prateleira FROM PRATELEIRA AS P WHERE EXISTS(SELECT * FROM SECAO AS S WHERE S.localizacao = 'Corredor 1, primeiro andar');


-- Selecionar o nome dos fornecedores que fornecem mais de um produto
SELECT F.nome FROM FORNECEDOR AS F
WHERE  1 < (SELECT COUNT(*) FROM PRODUTO AS P WHERE P.cnpj = F.cnpj);  

-- Selecionar o setor com o maior salário, mostrando também o funcionário em questão e seu salário
SELECT S.nome_setor,  F.nome, F.salario FROM SETOR AS S,FUNCIONARIO AS F
WHERE F.salario = (SELECT MAX(F1.salario) FROM FUNCIONARIO AS F1 WHERE F.id_setor = S.id_setor);

-- Selecionar o nome do produto mais barato de cada prateleira e o número da prateleira
SELECT PA.numero_prateleira, P.nome FROM PRATELEIRA AS PA, PRODUTO AS P
WHERE P.preco =(SELECT MIN(P1.preco) FROM PRODUTO AS P1 WHERE P1.numero_prateleira = PA.numero_prateleira);


-- Selecionar a idade do dependente mais novo de cada funcionário, e também o nome deste funcionário
SELECT D.idade, F.nome FROM FUNCIONARIO AS F, DEPENDENTE AS D
WHERE D.idade =(SELECT MIN(D1.idade) FROM DEPENDENTE AS D1 WHERE F.id = D1.id);
 
-- Selecionar o nome e o salário dos funcionários que trabalham no setor "empacotadores"(#1), e possuem um salário igual ou acima da média do setor.
SELECT F.nome, F.salario FROM FUNCIONARIO AS F,SETOR AS S
WHERE F.id_setor = "#1"AND
EXISTS(SELECT * FROM FUNCIONARIO AS F1, SETOR AS S1 WHERE F.id_setor = S.id_setor) 
AND 
F.salario >= (SELECT AVG(F2.salario) FROM FUNCIONARIO AS F2, SETOR AS S2 WHERE S2.id_setor = F2.id_setor AND S2.id_setor ="#1");         

