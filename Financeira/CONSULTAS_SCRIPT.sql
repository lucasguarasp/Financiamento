USE [Financeira]
GO

--Listar todos os clientes do estado de SP que tenham mais de 60% das parcelas pagas.
EXEC PR_parcelas_pagas @porcentagem = 60
--OU

--SELECT c.*, CONCAT((p.TotalPago / f.ValorTotal * 100), ' %') AS ParcelasPagas
--FROM CLIENTE AS c
--INNER JOIN FINANCIAMENTO AS f on f.IdCliente = c.IdCliente
--INNER JOIN (
--	SELECT IdFinanciamento, 
--	SUM (ValorParcela) AS [TotalPago], COUNT(p.IdFinanciamento) AS QtdParcelaPaga 
--	FROM PARCELA AS p
--	Where p.DataPagamento IS NOT NULL
--	GROUP BY IdFinanciamento
--) AS p ON p.IdFinanciamento = f.IdFinanciamento
--WHERE c.UF = 'SP'
--AND (p.TotalPago / f.ValorTotal * 100) > 60


--Listar os primeiros 4 clientes que tenham alguma parcela com mais de 05 dias atrasadas (Data Vencimento maior que data atual E data pagamento nula)
(
SELECT TOP (4) c.*, p.DataVencimento, p.DataPagamento,  ABS(DATEDIFF(day, GETDATE() ,p.DataVencimento)) AS [Dias Vencidos]
FROM CLIENTE AS c
INNER JOIN FINANCIAMENTO AS f on f.IdCliente = c.IdCliente
INNER JOIN PARCELA AS p ON p.IdFinanciamento =  f.IdFinanciamento
WHERE p.DataPagamento IS NULL
AND p.DataVencimento <= GETDATE()
AND p.DataVencimento < DateAdd(day, -5 ,GETDATE())
)


--Listar todos os clientes que já atrasaram em algum momento duas ou mais parcelas em mais de 10 dias, e que o valor do financiamento seja maior que R$ 10.000,00.
(
SELECT DISTINCT c.*, Quantidade.Qtd AS [Qtd Parcelas Atrasadas], f.ValorTotal
FROM CLIENTE AS c
INNER JOIN (
	SELECT  *        
FROM  FINANCIAMENTO as f
WHERE f.ValorTotal > 10000
)AS f on f.IdCliente = c.IdCliente
INNER JOIN PARCELA AS p ON p.IdFinanciamento =  f.IdFinanciamento
INNER JOIN (
SELECT   p.IdFinanciamento,
         COUNT(p.IdFinanciamento) AS Qtd
FROM  PARCELA as p
GROUP BY p.IdFinanciamento
HAVING   COUNT(p.IdFinanciamento) >= 2
) AS Quantidade ON Quantidade.IdFinanciamento = p.IdFinanciamento

WHERE 
DataPagamento > p.DataVencimento OR DataPagamento IS NULL
AND p.DataVencimento < DateAdd(day, -10 ,GETDATE())
)
