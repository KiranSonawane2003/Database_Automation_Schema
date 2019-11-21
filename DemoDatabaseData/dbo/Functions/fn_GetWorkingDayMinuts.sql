-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION  [dbo].[fn_GetWorkingDayMinuts] 
(
	@StartDate DATETIME,
    @EndDate DATETIME,
	@CountryId BIGINT
)
--RETURNS BIGINT
RETURNS VARCHAR(250)
AS
BEGIN
    DECLARE @Temp BIGINT
    SET @Temp=0
	--------------for negative value-------------------
	DECLARE @IsNegative bit
	
	SET @IsNegative = 0
	IF (@StartDate>@EndDate)
    BEGIN
		DECLARE @TempCurrentDate datetime = @StartDate;
        SET @StartDate = @EndDate
		SET @EndDate = @TempCurrentDate
		SET @IsNegative = 1
    END
	-------------------------------------
    DECLARE @FirstDay DATE
    SET @FirstDay = CONVERT(DATE, @StartDate, 112)

    DECLARE @LastDay DATE
    SET @LastDay = CONVERT(DATE, @EndDate, 112)

    DECLARE @StartTime TIME
    SET @StartTime = CONVERT(TIME, @StartDate)

    DECLARE @FinishTime TIME
    SET @FinishTime = CONVERT(TIME, @EndDate)

    DECLARE @WorkStart TIME
    SET @WorkStart =  (SELECT CONVERT(VARCHAR(5),CONVERT(TIME, CONVERT(VARCHAR,CONVERT(DATE, GETDATE()))+ ' ' + (SELECT TOP 1 WorkStartTime FROM WorkingDays WHERE CountryId=@CountryId), 120)))

    DECLARE @WorkFinish TIME
    SET @WorkFinish = (SELECT CONVERT(VARCHAR(5),CONVERT(TIME, CONVERT(VARCHAR,CONVERT(DATE, GETDATE()))+ ' ' + (SELECT TOP 1 WorkEndTime FROM WorkingDays WHERE CountryId=@CountryId), 120)))

    DECLARE @DailyWorkTime BIGINT
    SET @DailyWorkTime = DATEDIFF(MINUTE, @WorkStart, @WorkFinish)

    IF (@StartTime<@WorkStart)
    BEGIN
        SET @StartTime = @WorkStart
    END
    IF (@FinishTime>@WorkFinish)
    BEGIN
        SET @FinishTime=@WorkFinish
    END
    IF (@FinishTime<@WorkStart)
    BEGIN
        SET @FinishTime=@WorkStart
    END
    IF (@StartTime>@WorkFinish)
    BEGIN
        SET @StartTime = @WorkFinish
    END

    DECLARE @CurrentDate DATE
    SET @CurrentDate = @FirstDay
    DECLARE @LastDate DATE
    SET @LastDate = @LastDay

    WHILE(@CurrentDate<=@LastDate)
    BEGIN       
        --IF (DATEPART(dw, @CurrentDate)!=1 AND DATEPART(dw, @CurrentDate)!=7)
		IF(DATEPART(dw, @CurrentDate) IN (SELECT distinct number FROM master..spt_values WHERE number BETWEEN 1 and 7
										  AND number IN (SELECT WorkingDay FROM WorkingDays where CountryId=@CountryId and IsActive=1)
										  ))
        BEGIN
            IF (@CurrentDate!=@FirstDay) AND (@CurrentDate!=@LastDay)
            BEGIN
                SET @Temp = @Temp + @DailyWorkTime
            END
            --IF it starts at startdate and it finishes not this date find diff between work finish and start as minutes
            ELSE IF (@CurrentDate=@FirstDay) AND (@CurrentDate!=@LastDay)
            BEGIN
                SET @Temp = @Temp + DATEDIFF(MINUTE, @StartTime, @WorkFinish)
            END

            ELSE IF (@CurrentDate!=@FirstDay) AND (@CurrentDate=@LastDay)
            BEGIN
                SET @Temp = @Temp + DATEDIFF(MINUTE, @WorkStart, @FinishTime)
            END
            --IF it starts and finishes in the same date
            ELSE IF (@CurrentDate=@FirstDay) AND (@CurrentDate=@LastDay)
            BEGIN
                SET @Temp = DATEDIFF(MINUTE, @StartTime, @FinishTime)
            END
        END
        SET @CurrentDate = DATEADD(day, 1, @CurrentDate)
    END

    -- Return the result of the function
    IF @Temp<0
    BEGIN
        SET @Temp=0
    END
	--RETURN @Temp -(dbo.fn_GetHolidayMinutes (DATEADD(dd, 0, DATEDIFF(dd, 0, @StartDate)),DATEADD(dd, 0, DATEDIFF(dd, 0, @EndDate)),@CountryId))
	--RETURN @Temp

	DECLARE @theMinutes INT
	DECLARE @Result VARCHAR(250)
	DECLARE @Days VARCHAR(250)
	DECLARE @Hours VARCHAR(250)
	DECLARE @Minuts VARCHAR(250)
	DECLARE @WokringHrsByDays VARCHAR(250)
	
	SET @theMinutes = @Temp -(dbo.fn_GetHolidayMinutes (DATEADD(dd, 0, DATEDIFF(dd, 0, @StartDate)),DATEADD(dd, 0, DATEDIFF(dd, 0, @EndDate)),@CountryId))
	SET @Days=(@theMinutes / ((SELECT TOP 1 STUFF(WorkingHours,2,2,'') FROM dbo.WorkingDays WHERE CountryId=@CountryId) * 60))
	Set @Hours=(@theMinutes % ((SELECT TOP 1 STUFF(WorkingHours,2,2,'') FROM dbo.WorkingDays WHERE CountryId=@CountryId) * 60)) / 60
	
	
	Set @WokringHrsByDays=(((SELECT TOP 1 STUFF(WorkingHours,2,4,'') FROM dbo.WorkingDays WHERE CountryId=@CountryId) * 60) / 60)*@Days
	SET @Hours=CONVERT(INT,@Hours)+CONVERT(INT,@WokringHrsByDays)
	SET @Minuts=@theMinutes % 60
	
	--SET @Result= CONCAT(CASE WHEN LEN(@Days)=1 THEN '0' + @Days ELSE @Days END,':',CASE WHEN LEN(@Hours)=1 THEN '0' + @Hours ELSE @Hours END,  ':', CASE WHEN LEN(@Minuts)=1 THEN '0' +@Minuts ELSE @Minuts END)
	SET @Result= CONCAT(CASE WHEN LEN(@Hours)=1 THEN '0' + @Hours ELSE @Hours END,  ':', CASE WHEN LEN(@Minuts)=1 THEN '0' +@Minuts ELSE @Minuts END)
	
	IF(@IsNegative = 1)
	BEGIN
        SET @Result = '-' + @Result
    END
	RETURN @Result
END


