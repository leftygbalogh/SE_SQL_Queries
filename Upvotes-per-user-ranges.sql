DECLARE @V_Counter INT = 1;
declare @rangeLow int
declare @rangeHi int
declare @rangeStep int
declare @rangeMultiplier int
declare @rangeCounter int
declare @rangeLimit int
declare @numberOfUser int
declare @totalNumberOfUsers float

set @rangeCounter=0
set @rangeLow=0
set @rangeStep=5
set @rangeHi=@rangeLow + @rangeStep
set @rangeLimit=1000
set @rangeMultiplier=2

--Entire User Base
select @totalNumberOfUsers=count(Id)
    from Users
    PRINT char(9)+'The number of users in the entire community: '+char(9)+
    STR(CAST(@totalNumberOfUsers AS VARCHAR), 9, 0);
    PRINT '╔═══════════════════════════════════════════════════════════════════════════════════════════╗'

--Users with no votes at all
select @numberOfUser=count(Id)
    from Users
    where UpVotes=@rangeLow

    PRINT '  Number of users who never voted: '+char(9)+char(9)+char(9)+char(9)+
    STR(CAST(@numberOfUser AS VARCHAR), 9, 0)+char(9)+
    STR(CAST(@numberOfUser/@totalNumberOfUsers*100 AS VARCHAR), 9, 2)+'%';

--Range queries
WHILE (@rangeHi <= @rangeLimit)
BEGIN
    select @numberOfUser=count(Id)
    from Users
    where UpVotes>@rangeLow AND UpVotes<=@rangeHi;

    PRINT '  Number of users who upvoted between ' +char(9)+
    CAST(@rangeLow AS VARCHAR) +char(9)+ '-'+char(9)+
    CAST(@rangeHi AS VARCHAR) +': '+char(9)+
    STR(CAST(@numberOfUser AS VARCHAR), 9, 0)+char(9)+
    STR(CAST(@numberOfUser/@totalNumberOfUsers*100 AS VARCHAR), 9, 2)+'%';

    SET @rangeLow = @rangeHi;
    SET @rangeHi = @rangeHi + @rangeStep;
    SET @rangeStep = @rangeStep * @rangeMultiplier
END

--Users with more votes at all
select @numberOfUser=count(Id)
    from Users
    where UpVotes>@rangeHi

    PRINT '  Number of users who voted more: '+char(9)+char(9)+char(9)+char(9)+
    STR(CAST(@numberOfUser AS VARCHAR), 9, 0)+char(9)+
    STR(CAST(@numberOfUser/@totalNumberOfUsers*100 AS VARCHAR), 9, 2)+'%';
