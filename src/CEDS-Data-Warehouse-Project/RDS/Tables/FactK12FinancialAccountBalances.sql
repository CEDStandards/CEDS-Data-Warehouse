CREATE TABLE [RDS].[FactK12FinancialAccountBalances](
	[FactK12FinancialAccountBalanceId] [bigint] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_FactK12FinancialAccountBalances] PRIMARY KEY NONCLUSTERED 
(
	[FactK12FinancialAccountBalanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] ADD  CONSTRAINT [DF_FactK12FinancialAccountBalances_SeaId]  DEFAULT ((-1)) FOR [SeaId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] ADD  CONSTRAINT [DF_FactK12FinancialAccountBalances_IeuId]  DEFAULT ((-1)) FOR [IeuId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] ADD  CONSTRAINT [DF_FactK12FinancialAccountBalances_LeaId]  DEFAULT ((-1)) FOR [LeaId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] ADD  CONSTRAINT [DF_FactK12FinancialAccountBalances_K12SchoolId]  DEFAULT ((-1)) FOR [K12SchoolId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] ADD  CONSTRAINT [DF_FactK12FinancialAccountBalances_FinancialAccountingDateId]  DEFAULT ((-1)) FOR [FinancialAccountingDateId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] ADD  CONSTRAINT [DF_FactK12FinancialAccountBalances_FiscalYearId]  DEFAULT ((-1)) FOR [FiscalYearId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] ADD  CONSTRAINT [DF_FactK12FinancialAccountBalances_FederalFinancialAccountBalanceId]  DEFAULT ((-1)) FOR [FederalFinancialAccountBalanceId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] ADD  CONSTRAINT [DF_FactK12FinancialAccountBalances_SeaFinancialAccountBalanceId]  DEFAULT ((-1)) FOR [SeaFinancialAccountBalanceId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] ADD  CONSTRAINT [DF_FactK12FinancialAccountBalances_LeaFinancialAccountBalanceId]  DEFAULT ((-1)) FOR [LeaFinancialAccountBalanceId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] ADD  CONSTRAINT [DF_FactK12FinancialAccountBalances_FederalFinancialAccountClassificationId]  DEFAULT ((-1)) FOR [FederalFinancialAccountClassificationId]

GO
ALTER TABLE [RDS].[FactK12FinancialAccountBalances] ADD  CONSTRAINT [DF_FactK12FinancialAccountBalances_SeaFinancialAccountClassificationId]  DEFAULT ((-1)) FOR [SeaFinancialAccountClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] ADD  CONSTRAINT [DF_FactK12FinancialAccountBalances_LeaFinancialAccountClassificationId]  DEFAULT ((-1)) FOR [LeaFinancialAccountClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] ADD  CONSTRAINT [DF_FactK12FinancialAccountBalances_FederalFinancialAccountId]  DEFAULT ((-1)) FOR [FederalFinancialAccountId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] ADD  CONSTRAINT [DF_FactK12FinancialAccountBalances_SeaFinancialAccountId]  DEFAULT ((-1)) FOR [SeaFinancialAccountId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] ADD  CONSTRAINT [DF_FactK12FinancialAccountBalances_LeaFinancialAccountId]  DEFAULT ((-1)) FOR [LeaFinancialAccountId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] ADD  CONSTRAINT [DF_FactK12FinancialAccountBalances_FederalProgramCodeId]  DEFAULT ((-1)) FOR [FederalProgramCodeId]
GO



ALTER TABLE [RDS].[FactK12FinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBalances_SeaId] FOREIGN KEY([SeaId])
REFERENCES [RDS].[DimSeas] ([DimSeaId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] CHECK CONSTRAINT [FK_FactK12FinancialAccountBalances_SeaId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBalances_IeuId] FOREIGN KEY([IeuId])
REFERENCES [RDS].[DimIeus] ([DimIeuId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] CHECK CONSTRAINT [FK_FactK12FinancialAccountBalances_IeuId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBalances_LeaId] FOREIGN KEY([LeaId])
REFERENCES [RDS].[DimLeas] ([DimLeaId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] CHECK CONSTRAINT [FK_FactK12FinancialAccountBalances_LeaId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBalances_K12SchoolId] FOREIGN KEY([K12SchoolId])
REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] CHECK CONSTRAINT [FK_FactK12FinancialAccountBalances_K12SchoolId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBalances_FinancialAccountingDateId] FOREIGN KEY([FinancialAccountingDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] CHECK CONSTRAINT [FK_FactK12FinancialAccountBalances_FinancialAccountingDateId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBalances_FiscalYearId] FOREIGN KEY([FiscalYearId])
REFERENCES [RDS].[DimFiscalYears] ([DimFiscalYearId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] CHECK CONSTRAINT [FK_FactK12FinancialAccountBalances_FiscalYearId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBalances_FederalFinancialAccountBalanceId] FOREIGN KEY([FederalFinancialAccountBalanceId])
REFERENCES [RDS].[DimFederalFinancialAccountBalances] ([DimFederalFinancialAccountBalanceId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] CHECK CONSTRAINT [FK_FactK12FinancialAccountBalances_FederalFinancialAccountBalanceId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBalances_SeaFinancialAccountBalanceId] FOREIGN KEY([SeaFinancialAccountBalanceId])
REFERENCES [RDS].[DimSeaFinancialAccountBalances] ([DimSeaFinancialAccountBalanceId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] CHECK CONSTRAINT [FK_FactK12FinancialAccountBalances_SeaFinancialAccountBalanceId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBalances_LeaFinancialAccountBalanceId] FOREIGN KEY([LeaFinancialAccountBalanceId])
REFERENCES [RDS].[DimLeaFinancialAccountBalances] ([DimLeaFinancialAccountBalanceId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] CHECK CONSTRAINT [FK_FactK12FinancialAccountBalances_LeaFinancialAccountBalanceId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBalances_FederalFinancialAccountClassificationId] FOREIGN KEY([FederalFinancialAccountClassificationId])
REFERENCES [RDS].[DimFederalFinancialAccountClassifications] ([DimFederalFinancialAccountClassificationId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] CHECK CONSTRAINT [FK_FactK12FinancialAccountBalances_FederalFinancialAccountClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBalances_SeaFinancialAccountClassificationId] FOREIGN KEY([SeaFinancialAccountClassificationId])
REFERENCES [RDS].[DimSeaFinancialAccountClassifications] ([DimSeaFinancialAccountClassificationId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] CHECK CONSTRAINT [FK_FactK12FinancialAccountBalances_SeaFinancialAccountClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBalances_LeaFinancialAccountClassificationId] FOREIGN KEY([LeaFinancialAccountClassificationId])
REFERENCES [RDS].[DimLeaFinancialAccountClassifications] ([DimLeaFinancialAccountClassificationId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] CHECK CONSTRAINT [FK_FactK12FinancialAccountBalances_LeaFinancialAccountClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBalances_FederalFinancialAccountId] FOREIGN KEY([FederalFinancialAccountId])
REFERENCES [RDS].[DimFinancialAccounts] ([DimFinancialAccountId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] CHECK CONSTRAINT [FK_FactK12FinancialAccountBalances_FederalFinancialAccountId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBalances_SeaFinancialAccountId] FOREIGN KEY([SeaFinancialAccountId])
REFERENCES [RDS].[DimFinancialAccounts] ([DimFinancialAccountId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] CHECK CONSTRAINT [FK_FactK12FinancialAccountBalances_SeaFinancialAccountId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBalances_LeaFinancialAccountId] FOREIGN KEY([LeaFinancialAccountId])
REFERENCES [RDS].[DimFinancialAccounts] ([DimFinancialAccountId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] CHECK CONSTRAINT [FK_FactK12FinancialAccountBalances_LeaFinancialAccountId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountBalances_FederalProgramCodeId] FOREIGN KEY([FederalProgramCodeId])
REFERENCES [RDS].[DimFederalProgramCodes] ([DimFederalProgramCodeId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountBalances] CHECK CONSTRAINT [FK_FactK12FinancialAccountBalances_FederalProgramCodeId]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The value of a financial account balance or transaction.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountingValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Accounting Value' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountingValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001647' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountingValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22628' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountingValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountBalances', @level2type=N'COLUMN',@level2name=N'FinancialAccountingValue'
GO









