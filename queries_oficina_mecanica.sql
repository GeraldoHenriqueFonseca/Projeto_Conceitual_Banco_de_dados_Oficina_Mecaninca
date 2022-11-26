show databases;
use oficina_mecanica;
show tables;

-- informe todos os clientes e seus respectivos veiculos;
SELECT 
    c.Nome, c.CPF, v.Marca, v.Placa
FROM
    cliente_pf c
        JOIN
    veiculo v ON c.idCliente_pf = v.fk_idCliente_pf;
    
-- Todos os orçamentos com status aprovado;
Select * from Orcamento where Aprovado = 'SIM';
select * from `OS`;
select * from Orcamento;

-- crie um relatório, com o nome do cliente pj, nome, modelo, tipo, ano e km do veículo, seguido do numero do Orcamento, data, valor e validade e a equipe;
select c.Razão_Social, v.Modelo, v.Marca, v.Ano, v.KM, o.Numero_Orcamento, o.Data, o.Valor, o.Validade, e.Equipe from Orcamento o join veiculo v on o.fk_idVeiculo = v.idVeiculo join 
cliente_pj c on c.idCliente_pj = v.fk_idCliente_pj join equipe_Orcamento eo on eo.fk_idOrcamento = o.idOrcamento join equipe e on e.idEquipe = eo.fk_idEquipe;

-- Informe o valor total da Mão de Obra por Orcamentos ordenado pelo id do Orcamento;
SELECT
	 o.`idOrcamento`, o.`Numero_Orcamento`, 
     SUM(sp.`Qtd_Servico` * s.`Mão_de_Obra`) AS Total_Mão_de_Obra 
FROM
	`Orcamento` o 
		JOIN
	`Servico_Peca` sp ON o.`idOrcamento` = sp.`fk_idOrcamento` 
		JOIN
	`Servico` s ON sp.`fk_idServico` = s.`idServico` 
 GROUP BY
	o.`Numero_Orcamento` 
 ORDER BY o.`idOrcamento`;

-- Informe o valor total das Pecas por Orcamentos ordenado pelo id do Orcamento;
SELECT
o.idOrcamento, o.Numero_Orcamento, SUM(sp.Qtd_Peca * p.Valor_Unitário) AS Total_Pecas 
FROM
Orcamento o 
JOIN 
Servico_Peca sp ON o.idOrcamento = sp.fk_idOrcamento 
JOIN
Peca p ON sp.fk_idPeca = p.idPeca 
GROUP BY o.Numero_Orcamento 
ORDER BY o.idOrcamento;

-- Informe o valor total gasto com a mão de obra e Pecas de cada Orcamento ordenado pelo id do Orcamento;
SELECT 
o.idOrcamento, o.Numero_Orcamento,
SUM(sp.Qtd_Peca * p.Valor_Unitário) AS Total_Pecas,
SUM(sp.Qtd_Servico * s.Mão_de_Obra) AS Total_Mão_de_Obra,
SUM(sp.Qtd_Peca * p.Valor_Unitário) + sum(sp.Qtd_Servico * s.Mão_de_Obra) AS Total_Geral
FROM 
Orcamento o 
JOIN 
Servico_Peca sp ON o.idOrcamento = sp.fk_idOrcamento, Servico s, Peca p 
WHERE 
sp.fk_idServico = s.idServico 
AND 
sp.fk_idPeca = p.idPeca 
GROUP BY 
o.Numero_Orcamento 
ORDER BY 
o.idOrcamento;

-- relação completa de Orcamentos de pessoas fisicas;
SELECT cpf.Nome AS nome_cliente, cpf.Telefone AS contato,
v.Modelo, v.Marca, v.Placa,
v.Ano, v.KM, o.Numero_Orcamento,
o.Data, o.Validade,`s`.`Tipo do Servico`,
s.Descrição AS Desc_Servico,
s.Mão_de_Obra, sp.Qtd_Servico,
p.Nome_Peca AS Pecas, p.Descrição AS Desc_Peca,
p.Valor_unitário, sp.Qtd_Peca,
(s.Mão_de_Obra * sp.Qtd_Servico + p.Valor_Unitário * sp.Qtd_Peca) AS Total
FROM 
Orcamento o 
JOIN Servico_Peca sp ON o.idOrcamento = sp.fk_idOrcamento, Servico s, Peca p, veiculo v, cliente_pf cpf
WHERE sp.fk_idServico = s.idServico 
AND sp.fk_idPeca = p.idPeca 
AND o.fk_idVeiculo = v.idVeiculo 
AND v.fk_idCliente_pf = cpf.idCliente_pf;
