DECLARE @V_Counter INT = 1;

WHILE (1 = 1)
BEGIN
    PRINT @V_Counter;
    SET @V_Counter = @V_Counter + 1;

    IF @V_Counter = 4
    BEGIN
       BREAK;
    END
    PRINT 'STACKOVERFLOW'
END





declare @rangeLow int
declare @rangeHi int
declare @rangeStep int
declare @rangeMultiplier int
declare @rangeCounter int
declare @numberOfUser int

select @rangeCounter=0
select @rangeLow=0
select @rangeHi=1000
select @rangeStep=5
select @rangeMultiplier=2

WHILE ()@rangeCounter<=@rangeHi)
BEGIN
   {

   select @numberOfUser=count(Id)
   from Users
   where UpVotes>@rangeLow AND UpVotes<=rangeHi
   print @numberOfUser
   @rangeCounter=@rangeHi+1




   }
END;
