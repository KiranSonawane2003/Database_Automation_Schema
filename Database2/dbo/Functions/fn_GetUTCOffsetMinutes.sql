-- =============================================
-- Author: Vishal Bhau
-- Create date: 22-09-2019
-- Description:	Get UTCTimeOffset minutes for Branch and country
-- =============================================
--DROP FUNCTION  [dbo].[fn_GetUTCOffsetMinutes] 

CREATE FUNCTION  [dbo].[fn_GetUTCOffsetMinutes] 
(
    @BranchId BIGINT,
	@CountryId BIGINT
)
RETURNS INT
AS
BEGIN
DECLARE @OUTPUT INT;

	DECLARE @UTCminutesoffset int 
	set @UTCminutesoffset=0

	SET @UTCminutesoffset = (Select [UTCTimeOffset] FROM [Branch] where Id=@BranchId)
	
	IF @UTCminutesoffset=0 OR @UTCminutesoffset IS NULL BEGIN

		SET @UTCminutesoffset = (Select [UTCTimeOffset] FROM [Country] where Id=@CountryId)

	END
	
      (Select @OUTPUT= ISNULL(@UTCminutesoffset,0) )
	---print @OUTPUT; 
	--get the output in munutes
	RETURN @OUTPUT 
END