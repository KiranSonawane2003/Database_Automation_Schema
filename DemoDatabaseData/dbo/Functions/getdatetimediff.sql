
CREATE FUNCTION  dbo.getdatetimediff (@sourcedate VARCHAR(250),@destinationdate VARCHAR(250))
RETURNS VARCHAR(250)
AS BEGIN
    DECLARE @Result VARCHAR(250)

    

      select @Result=concat(Datediff(minute,CAST(@destinationdate as datetime), CAST(@sourcedate as datetime))/1440,':',
      (Datediff(minute,CAST(@destinationdate as datetime), CAST(@sourcedate as datetime))%1440)/60,':',
	    Datediff(minute,CAST(@destinationdate as datetime), CAST(@sourcedate as datetime))%60)

    RETURN @Result
END

