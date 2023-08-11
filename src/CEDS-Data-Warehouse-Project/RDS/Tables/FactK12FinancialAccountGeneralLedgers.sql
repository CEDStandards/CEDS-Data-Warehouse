CREATE TABLE [RDS].[FactK12FinancialAccountGeneralLedgers](
	[FactK12FinancialAccountGeneralLedgerId] [bigint] IDENTITY(1,1) NOT NULL,
	[SeaId] [int] NOT NULL,
	[IeuId] [int] NOT NULL,
	[LeaId] [int] NOT NULL,
	[K12SchoolId] [int] NOT NULL,
	[FinancialAccountingDateId] [int] NOT NULL,
	[FiscalYearId] [int] NOT NULL,
	[FederalFinancialAccountId] [int] NOT NULL,
	[SeaFinancialAccountId] [int] NOT NULL,
	[LeaFinancialAccountId] [int] NOT NULL,
	[FederalFinancialAccountClassificationId] [int] NOT NULL,
	[SeaFinancialAccountClassificationId] [int] NOT NULL,
	[LeaFinancialAccountClassificationId] [int] NOT NULL,
	[FederalFinancialExpenditureClassificationId] [int] NOT NULL,
	[SeaFinancialExpenditureClassificationId] [int] NOT NULL,
	[LeaFinancialExpenditureClassificationId] [int] NOT NULL,
	[FederalFinancialRevenueClassificationId] [int] NOT NULL,
	[SeaFinancialRevenueClassificationId] [int] NOT NULL,
	[LeaFinancialRevenueClassificationId] [int] NOT NULL,
	[FederalProgramCodeId] [int] NOT NULL,
	[FinancialAccountingValue] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_FactK12FinancialAccountGeneralLedgers] PRIMARY KEY NONCLUSTERED 
(
	[FactK12FinancialAccountGeneralLedgerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] ADD  CONSTRAINT [DF_FactK12FinancialAccountGeneralLedgers_SeaId]  DEFAULT ((-1)) FOR [SeaId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] ADD  CONSTRAINT [DF_FactK12FinancialAccountGeneralLedgers_IeuId]  DEFAULT ((-1)) FOR [IeuId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] ADD  CONSTRAINT [DF_FactK12FinancialAccountGeneralLedgers_LeaId]  DEFAULT ((-1)) FOR [LeaId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] ADD  CONSTRAINT [DF_FactK12FinancialAccountGeneralLedgers_K12SchoolId]  DEFAULT ((-1)) FOR [K12SchoolId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] ADD  CONSTRAINT [DF_FactK12FinancialAccountGeneralLedgers_FinancialAccountingDateId]  DEFAULT ((-1)) FOR [FinancialAccountingDateId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] ADD  CONSTRAINT [DF_FactK12FinancialAccountGeneralLedgers_FiscalYearId]  DEFAULT ((-1)) FOR [FiscalYearId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] ADD  CONSTRAINT [DF_FactK12FinancialAccountGeneralLedgers_FederalFinancialAccountId]  DEFAULT ((-1)) FOR [FederalFinancialAccountId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] ADD  CONSTRAINT [DF_FactK12FinancialAccountGeneralLedgers_SeaFinancialAccountId]  DEFAULT ((-1)) FOR [SeaFinancialAccountId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] ADD  CONSTRAINT [DF_FactK12FinancialAccountGeneralLedgers_LeaFinancialAccountId]  DEFAULT ((-1)) FOR [LeaFinancialAccountId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] ADD  CONSTRAINT [DF_FactK12FinancialAccountGeneralLedgers_FederalFinancialAccountClassificationId]  DEFAULT ((-1)) FOR [FederalFinancialAccountClassificationId]

GO
ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] ADD  CONSTRAINT [DF_FactK12FinancialAccountGeneralLedgers_SeaFinancialAccountClassificationId]  DEFAULT ((-1)) FOR [SeaFinancialAccountClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] ADD  CONSTRAINT [DF_FactK12FinancialAccountGeneralLedgers_LeaFinancialAccountClassificationId]  DEFAULT ((-1)) FOR [LeaFinancialAccountClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] ADD  CONSTRAINT [DF_FactK12FinancialAccountGeneralLedgers_FederalFinancialExpenditureClassificationId]  DEFAULT ((-1)) FOR [FederalFinancialExpenditureClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] ADD  CONSTRAINT [DF_FactK12FinancialAccountGeneralLedgers_SeaFinancialExpenditureClassificationId]  DEFAULT ((-1)) FOR [SeaFinancialExpenditureClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] ADD  CONSTRAINT [DF_FactK12FinancialAccountGeneralLedgers_LeaFinancialExpenditureClassificationId]  DEFAULT ((-1)) FOR [LeaFinancialExpenditureClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] ADD  CONSTRAINT [DF_FactK12FinancialAccountGeneralLedgers_FederalFinancialRevenueClassificationId]  DEFAULT ((-1)) FOR [FederalFinancialRevenueClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] ADD  CONSTRAINT [DF_FactK12FinancialAccountGeneralLedgers_SeaFinancialRevenueClassificationId]  DEFAULT ((-1)) FOR [SeaFinancialRevenueClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] ADD  CONSTRAINT [DF_FactK12FinancialAccountGeneralLedgers_LeaFinancialRevenueClassificationId]  DEFAULT ((-1)) FOR [LeaFinancialRevenueClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] ADD  CONSTRAINT [DF_FactK12FinancialAccountGeneralLedgers_FederalProgramCodeId]  DEFAULT ((-1)) FOR [FederalProgramCodeId]
GO



ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_SeaId] FOREIGN KEY([SeaId])
REFERENCES [RDS].[DimSeas] ([DimSeaId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] CHECK CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_SeaId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_IeuId] FOREIGN KEY([IeuId])
REFERENCES [RDS].[DimIeus] ([DimIeuId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] CHECK CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_IeuId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_LeaId] FOREIGN KEY([LeaId])
REFERENCES [RDS].[DimLeas] ([DimLeaId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] CHECK CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_LeaId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_K12SchoolId] FOREIGN KEY([K12SchoolId])
REFERENCES [RDS].[DimK12Schools] ([DimK12SchoolId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] CHECK CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_K12SchoolId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_FinancialAccountingDateId] FOREIGN KEY([FinancialAccountingDateId])
REFERENCES [RDS].[DimDates] ([DimDateId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] CHECK CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_FinancialAccountingDateId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_FiscalYearId] FOREIGN KEY([FiscalYearId])
REFERENCES [RDS].[DimFiscalYears] ([DimFiscalYearId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] CHECK CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_FiscalYearId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_FederalFinancialAccountId] FOREIGN KEY([FederalFinancialAccountId])
REFERENCES [RDS].[DimFinancialAccounts] ([DimFinancialAccountId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] CHECK CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_FederalFinancialAccountId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_SeaFinancialAccountId] FOREIGN KEY([SeaFinancialAccountId])
REFERENCES [RDS].[DimFinancialAccounts] ([DimFinancialAccountId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] CHECK CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_SeaFinancialAccountId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_LeaFinancialAccountId] FOREIGN KEY([LeaFinancialAccountId])
REFERENCES [RDS].[DimFinancialAccounts] ([DimFinancialAccountId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] CHECK CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_LeaFinancialAccountId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_FederalFinancialAccountClassificationId] FOREIGN KEY([FederalFinancialAccountClassificationId])
REFERENCES [RDS].[DimFederalFinancialAccountClassifications] ([DimFederalFinancialAccountClassificationId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] CHECK CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_FederalFinancialAccountClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_SeaFinancialAccountClassificationId] FOREIGN KEY([SeaFinancialAccountClassificationId])
REFERENCES [RDS].[DimSeaFinancialAccountClassifications] ([DimSeaFinancialAccountClassificationId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] CHECK CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_SeaFinancialAccountClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_LeaFinancialAccountClassificationId] FOREIGN KEY([LeaFinancialAccountClassificationId])
REFERENCES [RDS].[DimLeaFinancialAccountClassifications] ([DimLeaFinancialAccountClassificationId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] CHECK CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_LeaFinancialAccountClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_FederalFinancialExpenditureClassificationId] FOREIGN KEY([FederalFinancialExpenditureClassificationId])
REFERENCES [RDS].[DimFederalFinancialExpenditureClassifications] ([DimFederalFinancialExpenditureClassificationId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] CHECK CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_FederalFinancialExpenditureClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_SeaFinancialExpenditureClassificationId] FOREIGN KEY([SeaFinancialExpenditureClassificationId])
REFERENCES [RDS].[DimSeaFinancialExpenditureClassifications] ([DimSeaFinancialExpenditureClassificationId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] CHECK CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_SeaFinancialExpenditureClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_LeaFinancialExpenditureClassificationId] FOREIGN KEY([LeaFinancialExpenditureClassificationId])
REFERENCES [RDS].[DimLeaFinancialExpenditureClassifications] ([DimLeaFinancialExpenditureClassificationId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] CHECK CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_LeaFinancialExpenditureClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_FederalFinancialRevenueClassificationId] FOREIGN KEY([FederalFinancialRevenueClassificationId])
REFERENCES [RDS].[DimFederalFinancialRevenueClassifications] ([DimFederalFinancialRevenueClassificationId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] CHECK CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_FederalFinancialRevenueClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_SeaFinancialRevenueClassificationId] FOREIGN KEY([SeaFinancialRevenueClassificationId])
REFERENCES [RDS].[DimSeaFinancialRevenueClassifications] ([DimSeaFinancialRevenueClassificationId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] CHECK CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_SeaFinancialRevenueClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_LeaFinancialRevenueClassificationId] FOREIGN KEY([LeaFinancialRevenueClassificationId])
REFERENCES [RDS].[DimLeaFinancialRevenueClassifications] ([DimLeaFinancialRevenueClassificationId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] CHECK CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_LeaFinancialRevenueClassificationId]
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers]  WITH CHECK ADD  CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_FederalProgramCodeId] FOREIGN KEY([FederalProgramCodeId])
REFERENCES [RDS].[DimFederalProgramCodes] ([DimFederalProgramCodeId])
GO

ALTER TABLE [RDS].[FactK12FinancialAccountGeneralLedgers] CHECK CONSTRAINT [FK_FactK12FinancialAccountGeneralLedgers_FederalProgramCodeId]
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Def_Desc', @value=N'The value of a financial account balance or transaction.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountGeneralLedgers', @level2type=N'COLUMN',@level2name=N'FinancialAccountingValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_Element', @value=N'Financial Accounting Value' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountGeneralLedgers', @level2type=N'COLUMN',@level2name=N'FinancialAccountingValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_GlobalId', @value=N'001647' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountGeneralLedgers', @level2type=N'COLUMN',@level2name=N'FinancialAccountingValue'
GO

EXEC sys.sp_addextendedproperty @name=N'CEDS_URL', @value=N'https://ceds.ed.gov/CEDSElementDetails.aspx?TermId=22628' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountGeneralLedgers', @level2type=N'COLUMN',@level2name=N'FinancialAccountingValue'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'See the CEDS_GlobalId, CEDS_Element, CEDS_URL, and CEDS_Def_Desc extended properties.' , @level0type=N'SCHEMA',@level0name=N'RDS', @level1type=N'TABLE',@level1name=N'FactK12FinancialAccountGeneralLedgers', @level2type=N'COLUMN',@level2name=N'FinancialAccountingValue'
GO









