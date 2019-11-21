CREATE TABLE [dbo].[TransactionIncomeAndExpenditure](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NULL,
	[MonthlySalary] [decimal](18, 2) NULL,
	[Allowance] [decimal](18, 2) NULL,
	[OtherIncome] [decimal](18, 2) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NULL,
	[TotalIncome] [decimal](18, 2) NULL,
	[IsOwnHome] [bit] NULL,
	[BondHolderBank] [nvarchar](500) NULL,
	[Surburb] [nvarchar](100) NULL,
	[OutstandingBondAmount] [decimal](18, 2) NULL,
	[RentalValue] [decimal](18, 2) NULL,
	[LandlordName] [nvarchar](200) NULL,
	[LandlordAddress] [nvarchar](500) NULL,
	[HowAreYouPaid] [bigint] NULL,
	[NonMonetaryBenefits] [decimal](18, 2) NULL,
	[Expenditure] [decimal](18, 2) NULL,
	[Deductions] [decimal](18, 2) NULL,
	[Taxation] [decimal](18, 2) NULL,
	[Pension] [decimal](18, 2) NULL,
	[MedicalAidHospitalPlan] [decimal](18, 2) NULL,
	[LifeAssurancePremuims] [decimal](18, 2) NULL,
	[RetirementAnnuityPremuims] [decimal](18, 2) NULL,
	[BondRepayments] [decimal](18, 2) NULL,
	[WaterElectricty] [decimal](18, 2) NULL,
	[RatesTaxes] [decimal](18, 2) NULL,
	[LoanRepayments] [decimal](18, 2) NULL,
	[CreditCardRepayments] [decimal](18, 2) NULL,
	[InsurancePremiums] [decimal](18, 2) NULL,
	[Household] [decimal](18, 2) NULL,
	[MotorVehicles] [decimal](18, 2) NULL,
	[FurnitureAccounts] [decimal](18, 2) NULL,
	[Groceries] [decimal](18, 2) NULL,
	[SchoolFees] [decimal](18, 2) NULL,
	[ClothingAccounts] [decimal](18, 2) NULL,
	[Transport] [decimal](18, 2) NULL,
	[BudgetedSavings] [decimal](18, 2) NULL,
	[Maintenance] [decimal](18, 2) NULL,
	[DomesticStaff] [decimal](18, 2) NULL,
	[Cellphone] [decimal](18, 2) NULL,
	[Entertainment] [decimal](18, 2) NULL,
	[MNET] [decimal](18, 2) NULL,
	[ArmedResponse] [decimal](18, 2) NULL,
	[Gym] [decimal](18, 2) NULL,
	[TotalExpenditure] [decimal](18, 2) NULL,
	[MonthlyBondInstallment] [decimal](18, 2) NULL,
	[PurchasePrice] [decimal](18, 2) NULL,
	[PurchaseDate] [date] NULL,
	[PresentMarketValue] [decimal](18, 2) NULL,
	[RegisterdTo] [nvarchar](200) NULL,
	[StandNumber] [int] NULL,
	[IsGuarantor] [int] NOT NULL,
	[GrossMonthlySalary] [decimal](18, 2) NULL,
	[IsDeclaredInsolvent] [bit] NULL,
	[RehabilitationDate] [date] NULL,
	[IsUnderDebtReview] [bit] NULL,
	[IsGuarantorsDetails] [bit] NULL,
	[GuarantorDetails] [nvarchar](200) NULL,
	[IsShareholderInCompany] [bit] NULL,
	[ShareholdersDetail] [nvarchar](200) NULL,
	[IsShareDetailsWithinCompany] [bit] NULL,
	[IsShareDetailsAmongPartner] [bit] NULL,
	[IsReceiveMarketingInfo] [bit] NULL,
	[IsShareDetailsToFinancialInstitute] [bit] NULL,
	[IsDisclosureofPersonalInfo] [bit] NULL,
	[IsDebitOrderInformationAndAuthorization] [bit] NULL,
	[BasicMonthlySalary] [decimal](18, 4) NULL,
	[HomeLoanSubsidy] [decimal](18, 4) NULL,
	[CarAllowance] [decimal](18, 4) NULL,
	[OvertimeAndCommission] [decimal](18, 4) NULL,
	[SalaryDeductions] [decimal](18, 4) NULL,
	[SocialSecurity] [decimal](18, 4) NULL,
	[RentalIncome] [decimal](18, 4) NULL,
	[OtherDescription] [nvarchar](500) NULL,
	[OverdraftRepayments] [decimal](18, 4) NULL,
	[IsCreditRehabilitation] [bit] NULL,
	[ObtainCustomerBankStatements] [bit] NULL,
	[ObtainCustomerSalaryAdvice] [bit] NULL,
	[IsObtainCreditLifeInsurance] [bit] NULL,
	[OtherIncomeSource] [decimal](18, 4) NULL,
	[OtherAllowance] [decimal](18, 4) NULL,
	[LoanRepayments1] [decimal](18, 4) NULL,
	[LoanRepayments2] [decimal](18, 4) NULL,
	[LoanRepayments3] [decimal](18, 4) NULL,
	[LoanRepayments4] [decimal](18, 4) NULL,
	[LoanProviderId] [bigint] NULL,
	[Loan1ProviderId] [bigint] NULL,
	[Loan2ProviderId] [bigint] NULL,
	[Loan3ProviderId] [bigint] NULL,
	[Loan4ProviderId] [bigint] NULL,
	[LoanIsSettled] [bit] NULL,
	[Loan1IsSettled] [bit] NULL,
	[Loan2IsSettled] [bit] NULL,
	[Loan3IsSettled] [bit] NULL,
	[Loan4IsSettled] [bit] NULL,
	[OtherExpenses] [decimal](18, 4) NULL,
	[SalaryCertificateExpiryDate] [date] NULL,
	[SalaryReceivedDate1] [date] NULL,
	[SalaryReceivedDate2] [date] NULL,
	[SalaryReceivedDate3] [date] NULL,
	[OwnerShipTypeId] [bigint] NULL,
	[InWhoseName] [nvarchar](100) NULL,
	[FrequencyId] [bigint] NULL,
 CONSTRAINT [PK_TransactionIncomeAndExpenditure] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionIncomeAndExpenditure]  WITH CHECK ADD  CONSTRAINT [FK_TransactionIncomeAndExpenditure_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionIncomeAndExpenditure] CHECK CONSTRAINT [FK_TransactionIncomeAndExpenditure_Country]
GO
ALTER TABLE [dbo].[TransactionIncomeAndExpenditure]  WITH CHECK ADD  CONSTRAINT [FK_TransactionIncomeAndExpenditure_StaticValueHowAreYouPaid] FOREIGN KEY([HowAreYouPaid])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionIncomeAndExpenditure] CHECK CONSTRAINT [FK_TransactionIncomeAndExpenditure_StaticValueHowAreYouPaid]
GO
ALTER TABLE [dbo].[TransactionIncomeAndExpenditure]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionIncomeAndExpenditure_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[TransactionIncomeAndExpenditure] CHECK CONSTRAINT [FK_TransactionIncomeAndExpenditure_Transaction]
GO
ALTER TABLE [dbo].[TransactionIncomeAndExpenditure]  WITH CHECK ADD  CONSTRAINT [FK_TransactionIncomeAndExpenditure_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionIncomeAndExpenditure] CHECK CONSTRAINT [FK_TransactionIncomeAndExpenditure_UsersCreatedBy]
GO
ALTER TABLE [dbo].[TransactionIncomeAndExpenditure]  WITH CHECK ADD  CONSTRAINT [FK_TransactionIncomeAndExpenditure_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionIncomeAndExpenditure] CHECK CONSTRAINT [FK_TransactionIncomeAndExpenditure_UsersModifiedBy]
GO
ALTER TABLE [dbo].[TransactionIncomeAndExpenditure]  WITH NOCHECK ADD  CONSTRAINT [TransactionIncomeAndExpenditure_FK_StaticValueFrequencyId] FOREIGN KEY([FrequencyId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionIncomeAndExpenditure] CHECK CONSTRAINT [TransactionIncomeAndExpenditure_FK_StaticValueFrequencyId]
GO
ALTER TABLE [dbo].[TransactionIncomeAndExpenditure]  WITH NOCHECK ADD  CONSTRAINT [TransactionIncomeAndExpenditure_FK_StaticValueOwnerShipTypeId] FOREIGN KEY([OwnerShipTypeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionIncomeAndExpenditure] CHECK CONSTRAINT [TransactionIncomeAndExpenditure_FK_StaticValueOwnerShipTypeId]