CREATE TABLE [RDS].[FactFinancialAccountBalances](
	[FactFinancialAccountBalanceId] [bigint] IDENTITY(1,1) NOT NULL,
	[SeaId] [int] NOT NULL,
	[IeuId] [int] NOT NULL,
	[LeaId] [int] NOT NULL,
	[K12SchoolId] [int] NOT NULL,
	[FinancialAccountingDateId] [int] NOT NULL,
	[FiscalYearId] [int] NOT NULL,
	[FederalFinancialAccountBalanceId] [int] NOT NULL,
	[SeaFinancialAccountBalanceId] [int] NOT NULL,
	[LeaFinancialAccountBalanceId] [int] NOT NULL,
	[FederalFinancialAccountClassificationId] [int] NOT NULL,
	[SeaFinancialAccountClassificationId] [int] NOT NULL,
	[LeaFinancialAccountClassificationId] [int] NOT NULL,
	[FederalFinancialAccountId] [int] NOT NULL,
	[SeaFinancialAccountId] [int] NOT NULL,
	[LeaFinancialAccountId] [int] NOT NULL,
	[FederalProgramCodeId] [int] NOT NULL,
	[FinancialAccountingValue] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_FactFinancialAccountBalances] PRIMARY KEY NONCLUSTERED 
(
	[FactFinancialAccountBalanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IXFK_FactFinancialAccountBalances_SeaId] ON [RDS].[FactFinancialAccountBalances]([SeaId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactFinancialAccountBalances_IeuId] ON [RDS].[FactFinancialAccountBalances]([IeuId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactFinancialAccountBalances_LeaId] ON [RDS].[FactFinancialAccountBalances]([LeaId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactFinancialAccountBalances_K12SchoolId] ON [RDS].[FactFinancialAccountBalances]([K12SchoolId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactFinancialAccountBalances_FinancialAccountingDateId] ON [RDS].[FactFinancialAccountBalances]([FinancialAccountingDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactFinancialAccountBalances_FiscalYearId] ON [RDS].[FactFinancialAccountBalances]([FiscalYearId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactFinancialAccountBalances_FederalFinancialAccountBalanceId] ON [RDS].[FactFinancialAccountBalances]([FederalFinancialAccountBalanceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactFinancialAccountBalances_SeaFinancialAccountBalanceId] ON [RDS].[FactFinancialAccountBalances]([SeaFinancialAccountBalanceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactFinancialAccountBalances_LeaFinancialAccountBalanceId] ON [RDS].[FactFinancialAccountBalances]([LeaFinancialAccountBalanceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactFinancialAccountBalances_FederalFinancialAccountClassificationId] ON [RDS].[FactFinancialAccountBalances]([FederalFinancialAccountClassificationId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactFinancialAccountBalances_SeaFinancialAccountClassificationId] ON [RDS].[FactFinancialAccountBalances]([SeaFinancialAccountClassificationId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactFinancialAccountBalances_LeaFinancialAccountClassificationId] ON [RDS].[FactFinancialAccountBalances]([LeaFinancialAccountClassificationId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactFinancialAccountBalances_FederalFinancialAccountId] ON [RDS].[FactFinancialAccountBalances]([FederalFinancialAccountId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactFinancialAccountBalances_SeaFinancialAccountId] ON [RDS].[FactFinancialAccountBalances]([SeaFinancialAccountId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactFinancialAccountBalances_LeaFinancialAccountId] ON [RDS].[FactFinancialAccountBalances]([LeaFinancialAccountId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactFinancialAccountBalances_FederalProgramCodeId] ON [RDS].[FactFinancialAccountBalances]([FederalProgramCodeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO


ALTER TABLE [RDS].[FactFinancialAccountBalances] ADD  CONSTRAINT [DF_FactFinancialAccountBalances_SeaId]  DEFAULT ((-1)) FOR [SeaId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] ADD  CONSTRAINT [DF_FactFinancialAccountBalances_IeuId]  DEFAULT ((-1)) FOR [IeuId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] ADD  CONSTRAINT [DF_FactFinancialAccountBalances_LeaId]  DEFAULT ((-1)) FOR [LeaId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] ADD  CONSTRAINT [DF_FactFinancialAccountBalances_K12SchoolId]  DEFAULT ((-1)) FOR [K12SchoolId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] ADD  CONSTRAINT [DF_FactFinancialAccountBalances_FinancialAccountingDateId]  DEFAULT ((-1)) FOR [FinancialAccountingDateId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] ADD  CONSTRAINT [DF_FactFinancialAccountBalances_FiscalYearId]  DEFAULT ((-1)) FOR [FiscalYearId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] ADD  CONSTRAINT [DF_FactFinancialAccountBalances_FederalFinancialAccountBalanceId]  DEFAULT ((-1)) FOR [FederalFinancialAccountBalanceId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] ADD  CONSTRAINT [DF_FactFinancialAccountBalances_SeaFinancialAccountBalanceId]  DEFAULT ((-1)) FOR [SeaFinancialAccountBalanceId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] ADD  CONSTRAINT [DF_FactFinancialAccountBalances_LeaFinancialAccountBalanceId]  DEFAULT ((-1)) FOR [LeaFinancialAccountBalanceId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] ADD  CONSTRAINT [DF_FactFinancialAccountBalances_FederalFinancialAccountClassificationId]  DEFAULT ((-1)) FOR [FederalFinancialAccountClassificationId]

GO
ALTER TABLE [RDS].[FactFinancialAccountBalances] ADD  CONSTRAINT [DF_FactFinancialAccountBalances_SeaFinancialAccountClassificationId]  DEFAULT ((-1)) FOR [SeaFinancialAccountClassificationId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] ADD  CONSTRAINT [DF_FactFinancialAccountBalances_LeaFinancialAccountClassificationId]  DEFAULT ((-1)) FOR [LeaFinancialAccountClassificationId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] ADD  CONSTRAINT [DF_FactFinancialAccountBalances_FederalFinancialAccountId]  DEFAULT ((-1)) FOR [FederalFinancialAccountId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] ADD  CONSTRAINT [DF_FactFinancialAccountBalances_SeaFinancialAccountId]  DEFAULT ((-1)) FOR [SeaFinancialAccountId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] ADD  CONSTRAINT [DF_FactFinancialAccountBalances_LeaFinancialAccountId]  DEFAULT ((-1)) FOR [LeaFinancialAccountId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] ADD  CONSTRAINT [DF_FactFinancialAccountBalances_FederalProgramCodeId]  DEFAULT ((-1)) FOR [FederalProgramCodeId]
GO



ALTER TABLE [RDS].[FactFinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactFinancialAccountBalances_SeaId] FOREIGN KEY([SeaId])
REFERENCES [RDS].[DimSeas] ([DimSeaId])
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] CHECK CONSTRAINT [FK_FactFinancialAccountBalances_SeaId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactFinancialAccountBalances_IeuId] FOREIGN KEY([IeuId])
REFERENCES [RDS].[DimIeus] ([DimIeuId])
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] CHECK CONSTRAINT [FK_FactFinancialAccountBalances_IeuId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactFinancialAccountBalances_LeaId] FOREIGN KEY([LeaId])
REFERENCES [RDS].[DimLeas] ([DimLeaId])
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] CHECK CONSTRAINT [FK_FactFinancialAccountBalances_LeaId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactFinancialAccountBalances_K12SchoolId] FOREIGN KEY([K12SchoolId])
REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] CHECK CONSTRAINT [FK_FactFinancialAccountBalances_K12SchoolId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactFinancialAccountBalances_FinancialAccountingDateId] FOREIGN KEY([FinancialAccountingDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] CHECK CONSTRAINT [FK_FactFinancialAccountBalances_FinancialAccountingDateId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactFinancialAccountBalances_FiscalYearId] FOREIGN KEY([FiscalYearId])
REFERENCES [RDS].[DimFiscalYears] ([DimFiscalYearId])
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] CHECK CONSTRAINT [FK_FactFinancialAccountBalances_FiscalYearId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactFinancialAccountBalances_FederalFinancialAccountBalanceId] FOREIGN KEY([FederalFinancialAccountBalanceId])
REFERENCES [RDS].[DimFederalFinancialAccountBalances] ([DimFederalFinancialAccountBalanceId])
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] CHECK CONSTRAINT [FK_FactFinancialAccountBalances_FederalFinancialAccountBalanceId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactFinancialAccountBalances_SeaFinancialAccountBalanceId] FOREIGN KEY([SeaFinancialAccountBalanceId])
REFERENCES [RDS].[DimSeaFinancialAccountBalances] ([DimSeaFinancialAccountBalanceId])
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] CHECK CONSTRAINT [FK_FactFinancialAccountBalances_SeaFinancialAccountBalanceId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactFinancialAccountBalances_LeaFinancialAccountBalanceId] FOREIGN KEY([LeaFinancialAccountBalanceId])
REFERENCES [RDS].[DimLeaFinancialAccountBalances] ([DimLeaFinancialAccountBalanceId])
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] CHECK CONSTRAINT [FK_FactFinancialAccountBalances_LeaFinancialAccountBalanceId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactFinancialAccountBalances_FederalFinancialAccountClassificationId] FOREIGN KEY([FederalFinancialAccountClassificationId])
REFERENCES [RDS].[DimFederalFinancialAccountClassifications] ([DimFederalFinancialAccountClassificationId])
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] CHECK CONSTRAINT [FK_FactFinancialAccountBalances_FederalFinancialAccountClassificationId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactFinancialAccountBalances_SeaFinancialAccountClassificationId] FOREIGN KEY([SeaFinancialAccountClassificationId])
REFERENCES [RDS].[DimSeaFinancialAccountClassifications] ([DimSeaFinancialAccountClassificationId])
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] CHECK CONSTRAINT [FK_FactFinancialAccountBalances_SeaFinancialAccountClassificationId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactFinancialAccountBalances_LeaFinancialAccountClassificationId] FOREIGN KEY([LeaFinancialAccountClassificationId])
REFERENCES [RDS].[DimLeaFinancialAccountClassifications] ([DimLeaFinancialAccountClassificationId])
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] CHECK CONSTRAINT [FK_FactFinancialAccountBalances_LeaFinancialAccountClassificationId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactFinancialAccountBalances_FederalFinancialAccountId] FOREIGN KEY([FederalFinancialAccountId])
REFERENCES [RDS].[DimFinancialAccounts] ([DimFinancialAccountId])
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] CHECK CONSTRAINT [FK_FactFinancialAccountBalances_FederalFinancialAccountId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactFinancialAccountBalances_SeaFinancialAccountId] FOREIGN KEY([SeaFinancialAccountId])
REFERENCES [RDS].[DimFinancialAccounts] ([DimFinancialAccountId])
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] CHECK CONSTRAINT [FK_FactFinancialAccountBalances_SeaFinancialAccountId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactFinancialAccountBalances_LeaFinancialAccountId] FOREIGN KEY([LeaFinancialAccountId])
REFERENCES [RDS].[DimFinancialAccounts] ([DimFinancialAccountId])
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] CHECK CONSTRAINT [FK_FactFinancialAccountBalances_LeaFinancialAccountId]
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactFinancialAccountBalances_FederalProgramCodeId] FOREIGN KEY([FederalProgramCodeId])
REFERENCES [RDS].[DimFederalProgramCodes] ([DimFederalProgramCodeId])
GO

ALTER TABLE [RDS].[FactFinancialAccountBalances] CHECK CONSTRAINT [FK_FactFinancialAccountBalances_FederalProgramCodeId]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The value of a financial account balance or transaction.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountingValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Accounting Value' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountingValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001647' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountingValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22628' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountingValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactFinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountingValue'
GO









