CREATE DATABASE [Financeira]
GO

USE [Financeira]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 14/06/2020 17:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](max) NULL,
	[UF] [varchar](2) NULL,
	[Celular] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FINANCIAMENTO]    Script Date: 14/06/2020 17:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FINANCIAMENTO](
	[IdFinanciamento] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[TipoFinanciamento] [varchar](50) NULL,
	[ValorTotal] [float] NULL,
	[DataVencimento] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFinanciamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PARCELA]    Script Date: 14/06/2020 17:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PARCELA](
	[IdParcela] [int] IDENTITY(1,1) NOT NULL,
	[IdFinanciamento] [int] NOT NULL,
	[NumeroParcela] [int] NULL,
	[ValorParcela] [float] NULL,
	[DataVencimento] [datetime] NULL,
	[DataPagamento] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdParcela] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CLIENTE] ON 

INSERT [dbo].[CLIENTE] ([IdCliente], [Nome], [UF], [Celular]) VALUES (1, N'Lucas', N'SP', N'(11) 98824-1039')
INSERT [dbo].[CLIENTE] ([IdCliente], [Nome], [UF], [Celular]) VALUES (2, N'Paixão', N'PE', N'(12) 9926-9055')
INSERT [dbo].[CLIENTE] ([IdCliente], [Nome], [UF], [Celular]) VALUES (3, N'Lucas Damian ', N'SP', N'(11) 91234-1234')
INSERT [dbo].[CLIENTE] ([IdCliente], [Nome], [UF], [Celular]) VALUES (4, N'Lucas Vasconcelos', N'SP', N'(11) 94321-4321')
INSERT [dbo].[CLIENTE] ([IdCliente], [Nome], [UF], [Celular]) VALUES (5, N'Aguiar', N'SP', NULL)
INSERT [dbo].[CLIENTE] ([IdCliente], [Nome], [UF], [Celular]) VALUES (6, N'Pedro Lisboa', NULL, NULL)
SET IDENTITY_INSERT [dbo].[CLIENTE] OFF
SET IDENTITY_INSERT [dbo].[FINANCIAMENTO] ON 

INSERT [dbo].[FINANCIAMENTO] ([IdFinanciamento], [IdCliente], [TipoFinanciamento], [ValorTotal], [DataVencimento]) VALUES (1, 1, N'SFH', 11000, CAST(N'2020-06-11T16:50:38.117' AS DateTime))
INSERT [dbo].[FINANCIAMENTO] ([IdFinanciamento], [IdCliente], [TipoFinanciamento], [ValorTotal], [DataVencimento]) VALUES (2, 2, N'SFI', 7000, CAST(N'2020-06-11T16:50:38.120' AS DateTime))
INSERT [dbo].[FINANCIAMENTO] ([IdFinanciamento], [IdCliente], [TipoFinanciamento], [ValorTotal], [DataVencimento]) VALUES (3, 3, N'SAC', 8000, CAST(N'2020-06-11T16:50:38.120' AS DateTime))
INSERT [dbo].[FINANCIAMENTO] ([IdFinanciamento], [IdCliente], [TipoFinanciamento], [ValorTotal], [DataVencimento]) VALUES (4, 4, N'Tabela Price', 9000, CAST(N'2020-06-11T16:50:38.123' AS DateTime))
INSERT [dbo].[FINANCIAMENTO] ([IdFinanciamento], [IdCliente], [TipoFinanciamento], [ValorTotal], [DataVencimento]) VALUES (5, 5, N'Sacre', 12000, CAST(N'2020-06-11T16:50:38.123' AS DateTime))
INSERT [dbo].[FINANCIAMENTO] ([IdFinanciamento], [IdCliente], [TipoFinanciamento], [ValorTotal], [DataVencimento]) VALUES (6, 6, N'SFI', 10000, CAST(N'2020-06-11T16:50:38.130' AS DateTime))
SET IDENTITY_INSERT [dbo].[FINANCIAMENTO] OFF
SET IDENTITY_INSERT [dbo].[PARCELA] ON 

INSERT [dbo].[PARCELA] ([IdParcela], [IdFinanciamento], [NumeroParcela], [ValorParcela], [DataVencimento], [DataPagamento]) VALUES (1, 1, 21, 523.80952380952385, CAST(N'2020-06-07T00:00:00.000' AS DateTime), CAST(N'2020-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[PARCELA] ([IdParcela], [IdFinanciamento], [NumeroParcela], [ValorParcela], [DataVencimento], [DataPagamento]) VALUES (2, 2, 25, 280, CAST(N'2020-06-13T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PARCELA] ([IdParcela], [IdFinanciamento], [NumeroParcela], [ValorParcela], [DataVencimento], [DataPagamento]) VALUES (3, 3, 30, 266.66666666666669, CAST(N'2020-06-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PARCELA] ([IdParcela], [IdFinanciamento], [NumeroParcela], [ValorParcela], [DataVencimento], [DataPagamento]) VALUES (4, 4, 40, 225, CAST(N'2020-06-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PARCELA] ([IdParcela], [IdFinanciamento], [NumeroParcela], [ValorParcela], [DataVencimento], [DataPagamento]) VALUES (5, 5, 50, 240, CAST(N'2020-06-02T00:00:00.000' AS DateTime), CAST(N'2020-06-13T00:00:00.000' AS DateTime))
INSERT [dbo].[PARCELA] ([IdParcela], [IdFinanciamento], [NumeroParcela], [ValorParcela], [DataVencimento], [DataPagamento]) VALUES (6, 6, 50, 200, CAST(N'2020-06-07T00:00:00.000' AS DateTime), CAST(N'2020-06-18T00:00:00.000' AS DateTime))
INSERT [dbo].[PARCELA] ([IdParcela], [IdFinanciamento], [NumeroParcela], [ValorParcela], [DataVencimento], [DataPagamento]) VALUES (7, 6, 49, 200, CAST(N'2020-05-07T00:00:00.000' AS DateTime), CAST(N'2020-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[PARCELA] ([IdParcela], [IdFinanciamento], [NumeroParcela], [ValorParcela], [DataVencimento], [DataPagamento]) VALUES (8, 5, 49, 10000, CAST(N'2020-06-14T16:47:32.083' AS DateTime), CAST(N'2020-06-14T16:47:32.083' AS DateTime))
SET IDENTITY_INSERT [dbo].[PARCELA] OFF
ALTER TABLE [dbo].[FINANCIAMENTO]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[CLIENTE] ([IdCliente])
GO
ALTER TABLE [dbo].[PARCELA]  WITH CHECK ADD FOREIGN KEY([IdFinanciamento])
REFERENCES [dbo].[FINANCIAMENTO] ([IdFinanciamento])
GO
/****** Object:  StoredProcedure [dbo].[PR_parcelas_pagas]    Script Date: 14/06/2020 17:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_parcelas_pagas] @porcentagem FLOAT
AS
(SELECT c.*, CONCAT((p.TotalPago / f.ValorTotal * 100), ' %') AS ParcelasPagas
FROM CLIENTE AS c
INNER JOIN FINANCIAMENTO AS f on f.IdCliente = c.IdCliente
INNER JOIN (
	SELECT IdFinanciamento, 
	SUM (ValorParcela) AS [TotalPago], COUNT(p.IdFinanciamento) AS QtdParcelaPaga 
	FROM PARCELA AS p
	Where p.DataPagamento IS NOT NULL
	GROUP BY IdFinanciamento
) AS p ON p.IdFinanciamento = f.IdFinanciamento
WHERE c.UF = 'SP'
AND (p.TotalPago / f.ValorTotal * 100) > 60) 
GO
