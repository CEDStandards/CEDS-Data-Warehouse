CREATE TABLE Staging.K12FinancialAccountBalance (
	  Id																INT IDENTITY (1, 1) NOT NULL
	, SeaOrganizationIdentifierSea										NVARCHAR(60) NULL
	, IeuOrganizationIdentifierSea										NVARCHAR(60) NULL
	, LeaIdentifierSea													NVARCHAR(60) NULL
	, SchoolIdentifierSea												NVARCHAR(60) NULL
	, FiscalAccountingDate												DATE NULL
	, FiscalYear														SMALLINT NULL
	, Federal_FinancialAccountBalanceSheetCodeCode						NVARCHAR(50) NULL
	, Sea_FinancialAccountLocalBalanceSheetCodeCode						NVARCHAR(50) NULL
	, Sea_FinancialAccountLocalBalanceSheetCodeDescription				NVARCHAR(150) NULL
	, Lea_FinancialAccountLocalBalanceSheetCodeCode						NVARCHAR(50) NULL
	, Lea_FinancialAccountLocalBalanceSheetCodeDescription				NVARCHAR(150) NULL
	, Federal_FinancialAccountCategoryCode								NVARCHAR(50) NULL
	, Federal_FinancialAccountProgramCodeCode							NVARCHAR(50) NULL
	, Federal_FinancialAccountFundClassificationCode					NVARCHAR(50) NULL
	, Sea_FinancialAccountCategoryCode									NVARCHAR(50) NULL
	, Sea_FinancialAccountCategoryDescription							NVARCHAR(150) NULL
	, Sea_FinancialAccountLocalProgramCodeCode							NVARCHAR(50) NULL
	, Sea_FinancialAccountLocalProgramCodeDescription					NVARCHAR(150) NULL
	, Sea_FinancialAccountLocalFundClassificationCode					NVARCHAR(50) NULL
	, Sea_FinancialAccountLocalFundClassificationDescription			NVARCHAR(150) NULL
	, Lea_FinancialAccountCategoryCode									NVARCHAR(50) NULL
	, Lea_FinancialAccountCategoryDescription							NVARCHAR(150) NULL
	, Lea_FinancialAccountLocalProgramCodeCode							NVARCHAR(50) NULL
	, Lea_FinancialAccountLocalProgramCodeDescription					NVARCHAR(150) NULL
	, Lea_FinancialAccountLocalFundClassificationCode					NVARCHAR(50) NULL
	, Lea_FinancialAccountLocalFundClassificationDescription			NVARCHAR(150) NULL
	, Federal_FinancialAccountNumber									NVARCHAR(30) NULL
	, Federal_FinancialAccountName										NVARCHAR(100) NULL
	, Federal_FinancialAccountDescription								NVARCHAR(300) NULL
	, Sea_FinancialAccountNumber										NVARCHAR(30) NULL
	, Sea_FinancialAccountName											NVARCHAR(100) NULL
	, Sea_FinancialAccountDescription									NVARCHAR(300) NULL
	, Lea_FinancialAccountNumber										NVARCHAR(30) NULL
	, Lea_FinancialAccountName											NVARCHAR(100) NULL
	, Lea_FinancialAccountDescription									NVARCHAR(300) NULL
	, FederalProgramCode												NVARCHAR(50) NULL
	, FederalProgramCodeDescription										NVARCHAR(150) NULL
	, FederalProgramSubgrantCode										NVARCHAR(50) NULL
	, FederalProgramSubgrantCodeDescription								NVARCHAR(150) NULL
	, FinancialAccountingValue											DECIMAL(9,2) NOT NULL
	)


