CREATE TABLE [RDS].[FactK12FinancialAccountBudgets](
	[FactK12FinancialAccountBudgetId] [bigint] IDENTITY(1,1) NOT NULL,
	[SeaId] [int] NOT NULL,
	[IeuId] [int] NOT NULL,
	[LeaId] [int] NOT NULL,
	[K12SchoolId] [int] NOT NULL,
	[FinancialAccountingDateId] [int] NOT NULL,
	[FiscalYearId] [int] NOT NULL,
	[FiscalPeriodId] [int] NOT NULL,
	[FederalFinancialAccountBalanceId] [int] NOT NULL,
	[SeaFinancialAccountBalanceId] [int] NOT NULL,
	[LeaFinancialAccountBalanceId] [int] NOT NULL,
	[FederalFinancialAccountClassificationId] [int] NOT NULL,
	[SeaFinancialAccountClassificationId] [int] NOT NULL,
	[LeaFinancialAccountClassificationId] [int] NOT NULL,
	[FederalFinancialAccountId] [int] NOT NULL,
	[SeaFinancialAccountId] [int] NOT NULL,
	[LeaFinancialAccountId] [int] NOT NULL,
	[FederalFinancialExpenditureClassificationId] [int] NOT NULL,
	[SeaFinancialExpenditureClassificationId] [int] NOT NULL,
	[LeaFinancialExpenditureClassificationId] [int] NOT NULL,
	[FederalFinancialRevenueClassificationId] [int] NOT NULL,
	[SeaFinancialRevenueClassificationId] [int] NOT NULL,
	[LeaFinancialRevenueClassificationId] [int] NOT NULL,
	[FederalProgramCodeId] [int] NOT NULL,
	[FinancialAccountingPeriodBudgetedValue] [decimal](9, 2) NOT NULL,
	[FinancialAccountingPeriodEncumberedValue] [decimal](9, 2) NOT NULL,
	[FinancialAccountingPeriodActualValue] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_FactK12FinancialAccountBudgets] PRIMARY KEY NONCLUSTERED 
(
	[FactK12FinancialAccountBudgetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_SeaId] ON [RDS].[FactK12FinancialAccountBudgets]([SeaId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_IeuId] ON [RDS].[FactK12FinancialAccountBudgets]([IeuId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_LeaId] ON [RDS].[FactK12FinancialAccountBudgets]([LeaId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_K12SchoolId] ON [RDS].[FactK12FinancialAccountBudgets]([K12SchoolId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_FinancialAccountingDateId] ON [RDS].[FactK12FinancialAccountBudgets]([FinancialAccountingDateId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_FiscalYearId] ON [RDS].[FactK12FinancialAccountBudgets]([FiscalYearId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_FiscalPeriodId] ON [RDS].[FactK12FinancialAccountBudgets]([FiscalPeriodId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_FederalFinancialAccountBalanceId] ON [RDS].[FactK12FinancialAccountBudgets]([FederalFinancialAccountBalanceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_SeaFinancialAccountBalanceId] ON [RDS].[FactK12FinancialAccountBudgets]([SeaFinancialAccountBalanceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_LeaFinancialAccountBalanceId] ON [RDS].[FactK12FinancialAccountBudgets]([LeaFinancialAccountBalanceId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_FederalFinancialAccountClassificationId] ON [RDS].[FactK12FinancialAccountBudgets]([FederalFinancialAccountClassificationId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_SeaFinancialAccountClassificationId] ON [RDS].[FactK12FinancialAccountBudgets]([SeaFinancialAccountClassificationId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_LeaFinancialAccountClassificationId] ON [RDS].[FactK12FinancialAccountBudgets]([LeaFinancialAccountClassificationId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_FederalFinancialAccountId] ON [RDS].[FactK12FinancialAccountBudgets]([FederalFinancialAccountId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_SeaFinancialAccountId] ON [RDS].[FactK12FinancialAccountBudgets]([SeaFinancialAccountId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_LeaFinancialAccountId] ON [RDS].[FactK12FinancialAccountBudgets]([LeaFinancialAccountId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_FederalFinancialExpenditureClassificationId] ON [RDS].[FactK12FinancialAccountBudgets]([FederalFinancialExpenditureClassificationId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_SeaFinancialExpenditureClassificationId] ON [RDS].[FactK12FinancialAccountBudgets]([SeaFinancialExpenditureClassificationId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_LeaFinancialExpenditureClassificationId] ON [RDS].[FactK12FinancialAccountBudgets]([LeaFinancialExpenditureClassificationId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_FederalFinancialRevenueClassificationId] ON [RDS].[FactK12FinancialAccountBudgets]([FederalFinancialRevenueClassificationId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_SeaFinancialRevenueClassificationId] ON [RDS].[FactK12FinancialAccountBudgets]([SeaFinancialRevenueClassificationId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_LeaFinancialRevenueClassificationId] ON [RDS].[FactK12FinancialAccountBudgets]([LeaFinancialRevenueClassificationId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO
CREATE NONCLUSTERED INDEX [IXFK_FactK12FinancialAccountBudgets_FederalProgramCodeId] ON [RDS].[FactK12FinancialAccountBudgets]([FederalProgramCodeId] ASC) WITH (FILLFACTOR = 80, DATA_COMPRESSION = PAGE);
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_SeaId]  DEFAULT ((-1)) FOR [SeaId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_IeuId]  DEFAULT ((-1)) FOR [IeuId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_LeaId]  DEFAULT ((-1)) FOR [LeaId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_K12SchoolId]  DEFAULT ((-1)) FOR [K12SchoolId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_FinancialAccountingDateId]  DEFAULT ((-1)) FOR [FinancialAccountingDateId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_FiscalYearId]  DEFAULT ((-1)) FOR [FiscalYearId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_FiscalPeriodId]  DEFAULT ((-1)) FOR [FiscalPeriodId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_FederalFinancialAccountBalanceId]  DEFAULT ((-1)) FOR [FederalFinancialAccountBalanceId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_SeaFinancialAccountBalanceId]  DEFAULT ((-1)) FOR [SeaFinancialAccountBalanceId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_LeaFinancialAccountBalanceId]  DEFAULT ((-1)) FOR [LeaFinancialAccountBalanceId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_FederalFinancialAccountClassificationId]  DEFAULT ((-1)) FOR [FederalFinancialAccountClassificationId]

GO
ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_SeaFinancialAccountClassificationId]  DEFAULT ((-1)) FOR [SeaFinancialAccountClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_LeaFinancialAccountClassificationId]  DEFAULT ((-1)) FOR [LeaFinancialAccountClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_FederalFinancialAccountId]  DEFAULT ((-1)) FOR [FederalFinancialAccountId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_SeaFinancialAccountId]  DEFAULT ((-1)) FOR [SeaFinancialAccountId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_LeaFinancialAccountId]  DEFAULT ((-1)) FOR [LeaFinancialAccountId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_FederalFinancialExpenditureClassificationId]  DEFAULT ((-1)) FOR [FederalFinancialExpenditureClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_SeaFinancialExpenditureClassificationId]  DEFAULT ((-1)) FOR [SeaFinancialExpenditureClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_LeaFinancialExpenditureClassificationId]  DEFAULT ((-1)) FOR [LeaFinancialExpenditureClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_FederalFinancialRevenueClassificationId]  DEFAULT ((-1)) FOR [FederalFinancialRevenueClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_SeaFinancialRevenueClassificationId]  DEFAULT ((-1)) FOR [SeaFinancialRevenueClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_LeaFinancialRevenueClassificationId]  DEFAULT ((-1)) FOR [LeaFinancialRevenueClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] ADD  CONSTRAINT [DF_FactK12FinancialAccountBudgets_FederalProgramCodeId]  DEFAULT ((-1)) FOR [FederalProgramCodeId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_SeaId] FOREIGN KEY([SeaId])
REFERENCES [RDS].[DimSeas] ([DimSeaId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_SeaId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_IeuId] FOREIGN KEY([IeuId])
REFERENCES [RDS].[DimIeus] ([DimIeuId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_IeuId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_LeaId] FOREIGN KEY([LeaId])
REFERENCES [RDS].[DimLeas] ([DimLeaId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_LeaId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_K12SchoolId] FOREIGN KEY([K12SchoolId])
REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_K12SchoolId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_FinancialAccountingDateId] FOREIGN KEY([FinancialAccountingDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_FinancialAccountingDateId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_FiscalYearId] FOREIGN KEY([FiscalYearId])
REFERENCES [RDS].[DimFiscalYears] ([DimFiscalYearId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_FiscalYearId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_FiscalPeriodId] FOREIGN KEY([FiscalPeriodId])
REFERENCES [RDS].[DimFiscalPeriods] ([DimFiscalPeriodId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_FiscalYearId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_FederalFinancialAccountBalanceId] FOREIGN KEY([FederalFinancialAccountBalanceId])
REFERENCES [RDS].[DimFederalFinancialAccountBalances] ([DimFederalFinancialAccountBalanceId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_FederalFinancialAccountBalanceId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_SeaFinancialAccountBalanceId] FOREIGN KEY([SeaFinancialAccountBalanceId])
REFERENCES [RDS].[DimSeaFinancialAccountBalances] ([DimSeaFinancialAccountBalanceId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_SeaFinancialAccountBalanceId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_LeaFinancialAccountBalanceId] FOREIGN KEY([LeaFinancialAccountBalanceId])
REFERENCES [RDS].[DimLeaFinancialAccountBalances] ([DimLeaFinancialAccountBalanceId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_LeaFinancialAccountBalanceId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_FederalFinancialAccountClassificationId] FOREIGN KEY([FederalFinancialAccountClassificationId])
REFERENCES [RDS].[DimFederalFinancialAccountClassifications] ([DimFederalFinancialAccountClassificationId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_FederalFinancialAccountClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_SeaFinancialAccountClassificationId] FOREIGN KEY([SeaFinancialAccountClassificationId])
REFERENCES [RDS].[DimSeaFinancialAccountClassifications] ([DimSeaFinancialAccountClassificationId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_SeaFinancialAccountClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_LeaFinancialAccountClassificationId] FOREIGN KEY([LeaFinancialAccountClassificationId])
REFERENCES [RDS].[DimLeaFinancialAccountClassifications] ([DimLeaFinancialAccountClassificationId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_LeaFinancialAccountClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_FederalFinancialAccountId] FOREIGN KEY([FederalFinancialAccountId])
REFERENCES [RDS].[DimFinancialAccounts] ([DimFinancialAccountId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_FederalFinancialAccountId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_SeaFinancialAccountId] FOREIGN KEY([SeaFinancialAccountId])
REFERENCES [RDS].[DimFinancialAccounts] ([DimFinancialAccountId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_SeaFinancialAccountId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_LeaFinancialAccountId] FOREIGN KEY([LeaFinancialAccountId])
REFERENCES [RDS].[DimFinancialAccounts] ([DimFinancialAccountId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_LeaFinancialAccountId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_FederalFinancialExpenditureClassificationId] FOREIGN KEY([FederalFinancialExpenditureClassificationId])
REFERENCES [RDS].[DimFederalFinancialExpenditureClassifications] ([DimFederalFinancialExpenditureClassificationId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_FederalFinancialExpenditureClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_SeaFinancialExpenditureClassificationId] FOREIGN KEY([SeaFinancialExpenditureClassificationId])
REFERENCES [RDS].[DimSeaFinancialExpenditureClassifications] ([DimSeaFinancialExpenditureClassificationId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_SeaFinancialExpenditureClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_LeaFinancialExpenditureClassificationId] FOREIGN KEY([LeaFinancialExpenditureClassificationId])
REFERENCES [RDS].[DimLeaFinancialExpenditureClassifications] ([DimLeaFinancialExpenditureClassificationId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_LeaFinancialExpenditureClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_FederalFinancialRevenueClassificationId] FOREIGN KEY([FederalFinancialRevenueClassificationId])
REFERENCES [RDS].[DimFederalFinancialRevenueClassifications] ([DimFederalFinancialRevenueClassificationId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_FederalFinancialRevenueClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_SeaFinancialRevenueClassificationId] FOREIGN KEY([SeaFinancialRevenueClassificationId])
REFERENCES [RDS].[DimSeaFinancialRevenueClassifications] ([DimSeaFinancialRevenueClassificationId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_SeaFinancialRevenueClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_LeaFinancialRevenueClassificationId] FOREIGN KEY([LeaFinancialRevenueClassificationId])
REFERENCES [RDS].[DimLeaFinancialRevenueClassifications] ([DimLeaFinancialRevenueClassificationId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_LeaFinancialRevenueClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBudgets_FederalProgramCodeId] FOREIGN KEY([FederalProgramCodeId])
REFERENCES [RDS].[DimFederalProgramCodes] ([DimFederalProgramCodeId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBudgets] CHECK CONSTRAINT [FK_FactK12FinancialAccountBudgets_FederalProgramCodeId]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The budgeted value of a financial account for the specified accounting period or fiscal year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountBudgets', @level2type=N'COLUMN',@level2name=N'FinancialAccountingPeriodBudgetedValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Accounting Period Budgeted Value' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountBudgets', @level2type=N'COLUMN',@level2name=N'FinancialAccountingPeriodBudgetedValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001351' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountBudgets', @level2type=N'COLUMN',@level2name=N'FinancialAccountingPeriodBudgetedValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22318' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountBudgets', @level2type=N'COLUMN',@level2name=N'FinancialAccountingPeriodBudgetedValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountBudgets', @level2type=N'COLUMN',@level2name=N'FinancialAccountingPeriodBudgetedValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The planned or obligated expense value of a financial account for the specified accounting period or fiscal year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountBudgets', @level2type=N'COLUMN',@level2name=N'FinancialAccountingPeriodEncumberedValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Accounting Period Encumbered Value' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountBudgets', @level2type=N'COLUMN',@level2name=N'FinancialAccountingPeriodEncumberedValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001644' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountBudgets', @level2type=N'COLUMN',@level2name=N'FinancialAccountingPeriodEncumberedValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22625' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountBudgets', @level2type=N'COLUMN',@level2name=N'FinancialAccountingPeriodEncumberedValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountBudgets', @level2type=N'COLUMN',@level2name=N'FinancialAccountingPeriodEncumberedValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The actual value of a financial account for the specified accounting period or fiscal year.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountBudgets', @level2type=N'COLUMN',@level2name=N'FinancialAccountingPeriodActualValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Accounting Period Actual Value' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountBudgets', @level2type=N'COLUMN',@level2name=N'FinancialAccountingPeriodActualValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001350' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountBudgets', @level2type=N'COLUMN',@level2name=N'FinancialAccountingPeriodActualValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22317' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountBudgets', @level2type=N'COLUMN',@level2name=N'FinancialAccountingPeriodActualValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountBudgets', @level2type=N'COLUMN',@level2name=N'FinancialAccountingPeriodActualValue'
GO








