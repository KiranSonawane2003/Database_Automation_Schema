

CREATE PROCEDURE [dbo].[LinkingFleetTransactions]

@TransactionId [bigint] null=0,
@TransactionStatusId [bigint] null=0,
@CloseAllLinkedTransactions bit null=0,
@IsUpdateTransaction bit null=0,
@FleetNumber nvarchar(max),
@UserId int null=0,
@Message nvarchar(max) OUTPUT

AS 

BEGIN

SET NOCOUNT ON;

BEGIN TRAN

Declare @PreviousFleetNumber nvarchar(max)
Declare @ParentTransactionId [bigint]
Declare @FirstFleetLinkedTransactionId [bigint]
Declare @LinkedTransactionsCount [bigint]
Declare @IsParentTranasaction bit
Declare @IsPreviousParentTranasaction bit
Declare @ErrorCount int
Declare @BranchId [bigint]
Declare @MessageFromSync nvarchar(max)
Declare @ActiveTranasctionStatusId bigint
Declare @IsTransactionClosed bit =0
Declare @ParentTransactionIdForPreviousFleetNumber [bigint]
Declare @PreviousFirstFleetLinkedTransactionId [bigint]
Declare @PreviousLinkedTransactionsCount [bigint]
Declare @PreviousTransactionStatusId [bigint]


set @PreviousFleetNumber = ''
set @MessageFromSync = ''
set @ParentTransactionId = 0
set @FirstFleetLinkedTransactionId = 0
set @LinkedTransactionsCount=0
set @ErrorCount = 0
set @BranchId=0
set @ActiveTranasctionStatusId=0
set @IsTransactionClosed=0
set @ParentTransactionIdForPreviousFleetNumber = 0
set @IsParentTranasaction=0
set @IsPreviousParentTranasaction=0
set @PreviousFirstFleetLinkedTransactionId = 0
set @PreviousLinkedTransactionsCount=0
set @PreviousTransactionStatusId=0

-- GET FLEET Number
set @ActiveTranasctionStatusId= (SELECT [Id] FROM [StaticValue] where [StaticCategoryId]=(Select [Id] FROM [dbo].[StaticCategory] where [Name]='TransactionStatus' and [IsActive]=1) AND [IsActive]=1 AND [EnumName]='ACTIVE')
set @PreviousFleetNumber =(Select [FleetNumber] FROM [Transaction] where [Id]=@TransactionId)
set @BranchId=(Select [BranchId] FROM [Transaction] where [Id]=@TransactionId)
set @FirstFleetLinkedTransactionId =(Select TOP 1 Id FROM [Transaction] where [FleetNumber]=@FleetNumber AND [BranchId]=@BranchId AND [isActive]=1 AND [ParentTransactionId] is NOT NULL AND ([TransactionStatusId] is NULL OR [TransactionStatusId]=@ActiveTranasctionStatusId))
set @LinkedTransactionsCount =(Select count(1) FROM [Transaction] where [FleetNumber]=@FleetNumber AND [BranchId]=@BranchId AND [isActive]=1 AND [Id]<>@TransactionId)

set @ParentTransactionId = (Select TOP 1 [Id] FROM [Transaction] where [FleetNumber]=@FleetNumber AND [BranchId]=@BranchId AND [isActive]=1 AND [ParentTransactionId] is NULL 
AND ([TransactionStatusId]=@ActiveTranasctionStatusId OR [TransactionStatusId] IS NULL) ORDER BY 1 DESC)

set @ParentTransactionIdForPreviousFleetNumber = (Select TOP 1 [Id] FROM [Transaction] where [FleetNumber]=@PreviousFleetNumber AND [BranchId]=@BranchId AND [isActive]=1 AND [ParentTransactionId] is NULL 
AND ([TransactionStatusId]=@ActiveTranasctionStatusId OR [TransactionStatusId] IS NULL) ORDER BY 1 DESC)

set @PreviousTransactionStatusId=(Select TransactionStatusId FROM [Transaction] where [Id]=@TransactionId)

print('@ActiveTranasctionStatusId')
print(@ActiveTranasctionStatusId)
print('@ParentTransactionId')
print(@ParentTransactionId)
print('@@LinkedTransactionsCount')
print(@LinkedTransactionsCount)

print('@PreviousFleetNumber')
print(@PreviousFleetNumber)

print('@FleetNumber')
print(@FleetNumber)

print('@@ParentTransactionIdForPreviousFleetNumber')
print(@ParentTransactionIdForPreviousFleetNumber)

print('@PreviousTransactionStatusId')
print(@PreviousTransactionStatusId)

IF (@TransactionStatusId is NULL) OR (@TransactionStatusId = @ActiveTranasctionStatusId)
BEGIN	
	set @IsTransactionClosed=0
END
ELSE
BEGIN	
	set @IsTransactionClosed=1
END


IF (@ParentTransactionId is NULL) OR (@ParentTransactionId = @TransactionId)
BEGIN	
	set @IsParentTranasaction=1
END

IF (@ParentTransactionIdForPreviousFleetNumber = @TransactionId)
BEGIN	
	set @IsPreviousParentTranasaction=1
END


print ('@IsPreviousParentTranasaction')
print(@IsPreviousParentTranasaction)

IF @IsUpdateTransaction = 1 --UPDATE TRANSACTION
BEGIN	
	--UPDATE TRANSACTION
	print('UPDATE TRANASACTION')
	IF @IsParentTranasaction = 1 -- PARENT TRANASACTION
	BEGIN
			print('PARENT TRANASACTION')
			IF @IsTransactionClosed =1 AND @CloseAllLinkedTransactions <> 1 -- CLOSE ONLY CURRENT PARENT TRANSACTION
			BEGIN 
				
				   print('@IsTransactionClosed =1 AND @CloseAllLinkedTransactions <> 1')

				    IF @TransactionStatusId IS NOT NULL AND @TransactionStatusId <> 0
					BEGIN 
						UPDATE [Transaction] SET [FleetNumber]=@FleetNumber,[ParentTransactionId]= null,TransactionStatusId=@TransactionStatusId
						where [Id]=@TransactionId	
					END
					ELSE
					BEGIN

						UPDATE [Transaction] SET [FleetNumber]=@FleetNumber,[ParentTransactionId]= null
						where [Id]=@TransactionId	

					END

					 
					 					
						
					PRINT('@@LinkedTransactionsCount')
					PRINT(@LinkedTransactionsCount)

					IF @LinkedTransactionsCount > 0 
					BEGIN

						PRINT('@FirstFleetLinkedTransactionId')
						PRINT(@FirstFleetLinkedTransactionId)

					IF @FirstFleetLinkedTransactionId IS NOT NULL 
					BEGIN

					    --MAKE FIRST CHILD AS PARENT TRANSACTION
					  UPDATE [Transaction] 
					  SET [ParentTransactionId] = @FirstFleetLinkedTransactionId
					  where [FleetNumber]=@FleetNumber AND [BranchId]=@BranchId AND [isActive]=1 
					  AND [Id]<> @TransactionId AND [Id]<> @FirstFleetLinkedTransactionId

					  UPDATE [Transaction] 
					  SET [ParentTransactionId] = null
					  where [Id] = @FirstFleetLinkedTransactionId

					  
						-- PARENT TRANASACTION
						-- CALL SYNC DATA FROM First Fleet Linked TRANSACTION		
						EXEC SyncFleetTransactions @TransactionId=@FirstFleetLinkedTransactionId,@FleetNumber=@FleetNumber,@UserId =@UserId,@PreviousTransactionStatusId=@PreviousTransactionStatusId,@Message=@MessageFromSync
						print @MessageFromSync


						---SYNC DOCUMENTS
						INSERT INTO [TransactionDocument]
						(
							   [TransactionId]
							  ,[DocumentCategoryId]
							  ,[DocumentDescription]
							  ,[DocumentPath]
							  ,[DocumentName]
							  ,[CountryId]
							  ,[IsActive]
							  ,[CreatedBy]
							  ,[ModifiedBy]
							  ,[CreatedDate]
							  ,[ModifiedDate]
							  ,[DocumentSize]
							  ,[FinanceApplicationId]
							  ,[LatestInd]
							  ,[ElectronicallySignedInd]
							  ,[IsAPIDocument]
							  ,[DocumentSource]
						)
						SELECT 
							   @FirstFleetLinkedTransactionId as [TransactionId]
							  ,[DocumentCategoryId]
							  ,[DocumentDescription]
							  ,[DocumentPath]
							  ,[DocumentName]
							  ,[CountryId]
							  ,[IsActive]
							  ,@UserId as [CreatedBy]
							  ,@UserId as [ModifiedBy]
							  ,GETUTCDATE() as [CreatedDate]
							  ,GETUTCDATE() as [ModifiedDate]							  
							  ,[DocumentSize]
							  ,[FinanceApplicationId]
							  ,[LatestInd]
							  ,[ElectronicallySignedInd]
							  ,[IsAPIDocument]
							  ,[DocumentSource]
						  FROM [TransactionDocument] where [TransactionId]=@TransactionId AND [IsActive]=1 AND FinanceApplicationId IS NULL
						  
					END

					END

			END
			ELSE IF @IsTransactionClosed =1 AND @CloseAllLinkedTransactions = 1-- CLOSE ALL LINKED TRANSACTION
			BEGIN

				print('@IsTransactionClosed =1 AND @CloseAllLinkedTransactions = 1')

					IF @TransactionStatusId IS NOT NULL AND @TransactionStatusId <> 0
					BEGIN 
						UPDATE [Transaction] SET [FleetNumber]=@FleetNumber,[ParentTransactionId]= null,TransactionStatusId=@TransactionStatusId
						where [Id]=@TransactionId	
					END
					ELSE
					BEGIN

						UPDATE [Transaction] SET [FleetNumber]=@FleetNumber,[ParentTransactionId]= null
					    where [Id]=@TransactionId	

					END


					
						
					IF @LinkedTransactionsCount > 0 
					BEGIN

					  Declare @TransactionStatus [bigint]
					  set @TransactionStatus = (Select [TransactionStatusId] from [Transaction] where [Id]= @TransactionId) 

					   print('@TransactionStatus')
					   print(@TransactionStatus)

					 --CLOSE ALL CHILD TRANSACTIONS
					  UPDATE [Transaction] SET [TransactionStatusId]= @TransactionStatus
					  where [FleetNumber]=@FleetNumber AND [BranchId]=@BranchId AND [isActive]=1 
					  AND [Id]<> @TransactionId 
					 

						-- PARENT TRANASACTION
						-- CALL SYNC DATA FROM PARENT TRANSACTION		
						EXEC SyncFleetTransactions @TransactionId=@TransactionId,@FleetNumber=@FleetNumber,@UserId =@UserId,@PreviousTransactionStatusId=@PreviousTransactionStatusId,@Message=@MessageFromSync
						print @MessageFromSync

					END

			END
			ELSE IF @IsTransactionClosed = 0 -- ACTIVE PARENT TRANSACTION
			BEGIN

					print('@IsTransactionClosed =0')

					IF @TransactionStatusId IS NOT NULL AND @TransactionStatusId <> 0
					BEGIN 
							UPDATE [Transaction] SET [FleetNumber]=@FleetNumber,[ParentTransactionId]= null,TransactionStatusId=@TransactionStatusId
							where [Id]=@TransactionId	
					END
					ELSE
					BEGIN

						UPDATE [Transaction] SET [FleetNumber]=@FleetNumber,[ParentTransactionId]= null
						where [Id]=@TransactionId	

					END

				print('@@LinkedTransactionsCount--')
				print(@LinkedTransactionsCount)

						
					IF @LinkedTransactionsCount > 0 
					BEGIN

						IF @ParentTransactionId Is NULL
						BEGIN

							set @ParentTransactionId = (Select TOP 1 [Id] FROM [Transaction] where [FleetNumber]=@FleetNumber AND [BranchId]=@BranchId AND [isActive]=1 AND [ParentTransactionId] is NULL 
										AND ([TransactionStatusId]=@ActiveTranasctionStatusId OR [TransactionStatusId] IS NULL) ORDER BY 1 DESC)

						END

						PRINT('UPDATE ALL CHILD TRANSACTIONS with PARENT TRANACTION ID')				  
					  --UPDATE ALL CHILD TRANSACTIONS with PARENT TRANACTION ID
					  UPDATE [Transaction] SET [ParentTransactionId] = @ParentTransactionId
					  where [FleetNumber]=@FleetNumber AND [BranchId]=@BranchId AND [isActive]=1 
					  AND [Id]<> @TransactionId 
					 

						-- PARENT TRANASACTION
						-- CALL SYNC DATA FROM PARENT TRANSACTION		
						EXEC SyncFleetTransactions @TransactionId=@TransactionId,@FleetNumber=@FleetNumber,@UserId =@UserId,@PreviousTransactionStatusId=@PreviousTransactionStatusId,@Message=@MessageFromSync
						print @MessageFromSync

					END

			END

			IF @PreviousFleetNumber != @FleetNumber 
			BEGIN
				print('@PreviousFleetNumber != @FleetNumber ')
				
				print ('@IsPreviousParentTranasaction')
				print(@IsPreviousParentTranasaction)

				IF @IsPreviousParentTranasaction=1  --IF CURRENT TRANSACTION IS PREVIOUSLY PARENT TRANSACTION
				BEGIN

				Print('in @IsPreviousParentTranasaction=1')

				set @PreviousFirstFleetLinkedTransactionId =(Select TOP 1 Id FROM [Transaction] where [FleetNumber]=@PreviousFleetNumber AND [BranchId]=@BranchId AND [isActive]=1 AND [ParentTransactionId] is NOT NULL AND ([TransactionStatusId] is NULL OR [TransactionStatusId]=@ActiveTranasctionStatusId))
				set @PreviousLinkedTransactionsCount =(Select count(1) FROM [Transaction] where [FleetNumber]=@PreviousFleetNumber AND [BranchId]=@BranchId AND [isActive]=1 AND [Id]<>@TransactionId)


				IF @PreviousLinkedTransactionsCount > 0 
				BEGIN

					PRINT('@@PreviousFirstFleetLinkedTransactionId')
					PRINT(@PreviousFirstFleetLinkedTransactionId)

					IF @PreviousFirstFleetLinkedTransactionId IS NOT NULL
					BEGIN

						PRINT('MAKE FIRST CHILD AS PARENT TRANSACTION')
						--MAKE FIRST CHILD AS PARENT TRANSACTION
						UPDATE [Transaction] 
						SET [ParentTransactionId] = @PreviousFirstFleetLinkedTransactionId
						where [FleetNumber]=@PreviousFleetNumber AND [BranchId]=@BranchId AND [isActive]=1 
						AND [Id]<> @TransactionId AND [Id]<> @PreviousFirstFleetLinkedTransactionId

								 
						UPDATE [Transaction] 
						SET [ParentTransactionId] = null
						where [Id] = @PreviousFirstFleetLinkedTransactionId
								  					  
						-- PARENT TRANASACTION
						-- CALL SYNC DATA FROM First Fleet Linked TRANSACTION		
						EXEC SyncFleetTransactions @TransactionId=@PreviousFirstFleetLinkedTransactionId,@FleetNumber=@PreviousFleetNumber,@UserId =@UserId,@PreviousTransactionStatusId=@PreviousTransactionStatusId,@Message=@MessageFromSync
						print @MessageFromSync

						---SYNC DOCUMENTS
						INSERT INTO [TransactionDocument]
						(
							   [TransactionId]
							  ,[DocumentCategoryId]
							  ,[DocumentDescription]
							  ,[DocumentPath]
							  ,[DocumentName]
							  ,[CountryId]
							  ,[IsActive]
							  ,[CreatedBy]
							  ,[ModifiedBy]
							  ,[CreatedDate]
							  ,[ModifiedDate]
							  ,[DocumentSize]
							  ,[FinanceApplicationId]
							  ,[LatestInd]
							  ,[ElectronicallySignedInd]
							  ,[IsAPIDocument]
							  ,[DocumentSource]
						)
						SELECT 
							   @PreviousFirstFleetLinkedTransactionId as [TransactionId]
							  ,[DocumentCategoryId]
							  ,[DocumentDescription]
							  ,[DocumentPath]
							  ,[DocumentName]
							  ,[CountryId]
							  ,[IsActive]
							  ,@UserId as [CreatedBy]
							  ,@UserId as [ModifiedBy]
							  ,GETUTCDATE() as [CreatedDate]
							  ,GETUTCDATE() as [ModifiedDate]							  
							  ,[DocumentSize]
							  ,[FinanceApplicationId]
							  ,[LatestInd]
							  ,[ElectronicallySignedInd]
							  ,[IsAPIDocument]
							  ,[DocumentSource]
						  FROM [TransactionDocument] where [TransactionId]=@TransactionId AND [IsActive]=1 AND FinanceApplicationId IS NULL

					END

				END


			END

			END

	END 
	ELSE -- CHILD TRANASACTION
	BEGIN
			 print('CHILD TRANASACTION')
			 print @TransactionStatusId
					
			IF @TransactionStatusId IS NOT NULL AND @TransactionStatusId <> 0 AND @TransactionStatusId <> 0
			BEGIN 
						print('@TransactionStatusId NOT null')
						UPDATE [Transaction] SET [FleetNumber]=@FleetNumber,[ParentTransactionId]= @ParentTransactionId,TransactionStatusId=@TransactionStatusId
						where [Id]=@TransactionId
			END
			ELSE
			BEGIN
					print('@TransactionStatusId null')
					UPDATE [Transaction] SET [FleetNumber]=@FleetNumber,[ParentTransactionId]= @ParentTransactionId
					where [Id]=@TransactionId
			END
						

			print('@PreviousFleetNumber')
			print(@PreviousFleetNumber)

			print('@FleetNumber')
			print(@FleetNumber)

			 IF @PreviousFleetNumber = @FleetNumber 
			 BEGIN
				
					 print('@PreviousFleetNumber == @FleetNumber ')
					  IF @LinkedTransactionsCount >= 0 
					  BEGIN

						  -- CHILD TRANASACTION
						  -- CALL SYNC DATA FROM CHILD TO OTHERs TRANSACTION
						  print('CALL SYNC DATA FROM CHILD TO PARENT OTHERS TRANSACTION')
						  EXEC SyncFleetTransactions @TransactionId=@TransactionId,@FleetNumber=@FleetNumber,@UserId =@UserId,@PreviousTransactionStatusId=@PreviousTransactionStatusId,@Message=@MessageFromSync
						  print @MessageFromSync

					  END
					  
			 END
			 ELSE  
			 BEGIN

		 				print('@PreviousFleetNumber <> @FleetNumber ')
						 IF @LinkedTransactionsCount >= 0 
						 BEGIN

						  -- CHILD TRANASACTION
						  -- CALL SYNC DATA FROM PARENT TO CHILD TRANSACTION
						  print('CALL SYNC DATA FROM PARENT TO CHILD TRANSACTION')
						  EXEC SyncFleetTransactions @TransactionId=@ParentTransactionId,@FleetNumber=@FleetNumber,@UserId =@UserId,@PreviousTransactionStatusId=@PreviousTransactionStatusId,@Message=@MessageFromSync
						  print @MessageFromSync

						  set @Message = 'RefreshRequired'



			  END

						IF @IsPreviousParentTranasaction=1 
						BEGIN

							Print('in @IsPreviousParentTranasaction=1')

						
							set @PreviousFirstFleetLinkedTransactionId =(Select TOP 1 Id FROM [Transaction] where [FleetNumber]=@PreviousFleetNumber AND [BranchId]=@BranchId AND [isActive]=1 AND [ParentTransactionId] is NOT NULL AND ([TransactionStatusId] is NULL OR [TransactionStatusId]=@ActiveTranasctionStatusId))
							set @PreviousLinkedTransactionsCount =(Select count(1) FROM [Transaction] where [FleetNumber]=@PreviousFleetNumber AND [BranchId]=@BranchId AND [isActive]=1 AND [Id]<>@TransactionId)

							PRINT('@@@PreviousLinkedTransactionsCount')
							PRINT(@PreviousLinkedTransactionsCount)

							IF @PreviousLinkedTransactionsCount > 0 
							BEGIN

								PRINT('@@PreviousFirstFleetLinkedTransactionId')
								PRINT(@PreviousFirstFleetLinkedTransactionId)

							IF @PreviousFirstFleetLinkedTransactionId IS NOT NULL
							BEGIN

									PRINT('MAKE FIRST CHILD AS PARENT TRANSACTION')
									--MAKE FIRST CHILD AS PARENT TRANSACTION
								  UPDATE [Transaction] 
								  SET [ParentTransactionId] = @PreviousFirstFleetLinkedTransactionId
								  where [FleetNumber]=@PreviousFleetNumber AND [BranchId]=@BranchId AND [isActive]=1 
								  AND [Id]<> @TransactionId AND [Id]<> @PreviousFirstFleetLinkedTransactionId

								 
								  UPDATE [Transaction] 
								  SET [ParentTransactionId] = null
								  where [Id] = @PreviousFirstFleetLinkedTransactionId
								  					  
									-- PARENT TRANASACTION
									-- CALL SYNC DATA FROM First Fleet Linked TRANSACTION		
									EXEC SyncFleetTransactions @TransactionId=@PreviousFirstFleetLinkedTransactionId,@FleetNumber=@PreviousFleetNumber,@UserId =@UserId,@PreviousTransactionStatusId=@PreviousTransactionStatusId,@Message=@MessageFromSync
									print @MessageFromSync

									---SYNC DOCUMENTS
									INSERT INTO [TransactionDocument]
									(
										   [TransactionId]
										  ,[DocumentCategoryId]
										  ,[DocumentDescription]
										  ,[DocumentPath]
										  ,[DocumentName]
										  ,[CountryId]
										  ,[IsActive]
										  ,[CreatedBy]
										  ,[ModifiedBy]
										  ,[CreatedDate]
										  ,[ModifiedDate]
										  ,[DocumentSize]
										  ,[FinanceApplicationId]
										  ,[LatestInd]
										  ,[ElectronicallySignedInd]
										  ,[IsAPIDocument]
										  ,[DocumentSource]
									)
									SELECT 
										   @PreviousFirstFleetLinkedTransactionId as [TransactionId]
										  ,[DocumentCategoryId]
										  ,[DocumentDescription]
										  ,[DocumentPath]
										  ,[DocumentName]
										  ,[CountryId]
										  ,[IsActive]
										  ,@UserId as [CreatedBy]
										  ,@UserId as [ModifiedBy]
										  ,GETUTCDATE() as [CreatedDate]
										  ,GETUTCDATE() as [ModifiedDate]							  
										  ,[DocumentSize]
										  ,[FinanceApplicationId]
										  ,[LatestInd]
										  ,[ElectronicallySignedInd]
										  ,[IsAPIDocument]
										  ,[DocumentSource]
									  FROM [TransactionDocument] where [TransactionId]=@TransactionId AND [IsActive]=1 AND FinanceApplicationId IS NULL

							END

							END


						END
					 
			 END


			
	END 

END
ELSE IF @IsUpdateTransaction = 0 --CREATE TRANSACTION
BEGIN	
	--CREATE TRANSACTION
		print('CREATE TRANSACTION')
	IF @IsParentTranasaction = 1 -- PARENT TRANSACTION
	BEGIN
					print(' PARENT TRANSACTION')

					IF @TransactionStatusId IS NOT NULL AND @TransactionStatusId <> 0
					BEGIN 
							UPDATE [Transaction] SET [FleetNumber]=@FleetNumber,[ParentTransactionId]= null,TransactionStatusId=@TransactionStatusId
							where [Id]=@TransactionId
					END
					ELSE
					BEGIN

							UPDATE [Transaction] SET [FleetNumber]=@FleetNumber,[ParentTransactionId]= null
							where [Id]=@TransactionId

					END

		
		
	END 
	ELSE 
	BEGIN
		  print('LINK CHILD TRANASACTION ')
		 -- LINK CHILD TRANASACTION 
		 -- UPDATE PARENT TRANSACTIONID
					IF @TransactionStatusId IS NOT NULL AND @TransactionStatusId <> 0
					BEGIN 
							 UPDATE [Transaction] SET [FleetNumber]=@FleetNumber,[ParentTransactionId]= @ParentTransactionId,TransactionStatusId=@TransactionStatusId
							 where [Id]=@TransactionId
					END
					ELSE
					BEGIN

							 UPDATE [Transaction] SET [FleetNumber]=@FleetNumber,[ParentTransactionId]= @ParentTransactionId
								where [Id]=@TransactionId

					END

		

		  -- CHILD TRANASACTION
		  -- CALL SYNC DATA FROM PARENT TO CHILD TRANSACTION
			EXEC SyncFleetTransactions @TransactionId=@ParentTransactionId,@FleetNumber=@FleetNumber,@UserId =@UserId,@PreviousTransactionStatusId=@PreviousTransactionStatusId,@Message=@MessageFromSync
			print @MessageFromSync


	END 

END




IF @Message IS NULL BEGIN
	set @Message ='Linking Fleet Transactions Successful.'	
END
SELECT @Message


COMMIT TRAN



END


