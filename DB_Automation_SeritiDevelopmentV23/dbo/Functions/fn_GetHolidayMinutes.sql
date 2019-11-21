-- =============================================
-- Author:		Rakesh Raushan
-- Create date: 09-05-2019
-- Description:	Get holiday minuts between two dates and country
-- =============================================
CREATE FUNCTION    [dbo].[fn_GetHolidayMinutes] 
(
	@StartDate DATETIME,
    @EndDate DATETIME,
	@CountryId BIGINT
)
RETURNS BIGINT
AS
BEGIN
DECLARE @OUTPUT BIGINT;
	DECLARE @HolidayList table (HolidaysDate date)
	--Create Table #HolidayList
	--(
	--	HolidaysDate date
	--)

	DECLARE @Date1 DATE, @Date2 DATE

	DECLARE holiday_cursor CURSOR FOR     
	Select StartDate,EndDate 
	from Holidays 
	where IsActive=1 
	and CountryId=@CountryId 
	and ((StartDate between @StartDate and @EndDate)  or (EndDate between @StartDate and @EndDate))
	OPEN HOLIDAY_CURSOR    
  
	FETCH NEXT FROM HOLIDAY_CURSOR     
	INTO @Date1 , @Date2    
 
  
	WHILE @@FETCH_STATUS = 0    
	BEGIN 
	--INSERT INTO  #HolidayList  
	INSERT INTO  @HolidayList
		SELECT DATEADD(DAY,number,@Date1) [Date]
	FROM master..spt_values
	WHERE type = 'P'
	AND DATEADD(DAY,number,@Date1) <= @Date2
		FETCH NEXT FROM HOLIDAY_CURSOR     
	INTO @Date1 , @Date2   
   
	END     
	CLOSE HOLIDAY_CURSOR;    
	DEALLOCATE HOLIDAY_CURSOR;

	 (Select @OUTPUT= Count( distinct HolidaysDate) from @HolidayList
	where HolidaysDate between @StartDate and @EndDate
		  AND DATEPART(dw, HolidaysDate) NOT IN (SELECT distinct number FROM master..spt_values WHERE number BETWEEN 1 and 7
										  AND number NOT IN (SELECT WorkingDay FROM WorkingDays where CountryId=@CountryId and IsActive=1)
										  ))
	---print @OUTPUT; --this will give in days
	--get the output in munutes
	RETURN @OUTPUT * (SELECT TOP 1 STUFF(WorkingHours,2,2,'') FROM dbo.WorkingDays WHERE CountryId=@CountryId) * 60;
END