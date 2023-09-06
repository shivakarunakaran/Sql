--alter procedure sp
--as
--begin
--select * from registration where age=24
--select *from registration where name like 'a%'
--end
--go

--exec sp

create procedure ps1
@qualification varchar(20)
as
begin
select * from registration where qualification =@qualification
end 
go  

exec ps1 @qualification='mbbs'


