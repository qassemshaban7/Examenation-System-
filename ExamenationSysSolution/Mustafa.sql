-- training manager edit Track

go
create or alter procedure sp_TrMager_Edit_Track
@managerAccount_ID int,
@Track_Id int,
@Name nvarchar(50)=Null,
@Description nvarchar(200)=Null
as
begin 
	begin try
	if(exists (select * from UserManagement.TrainingManager where AccountId=@managerAccount_ID))
	begin
	   if(exists(select*from AcademicRecords.Track where Id=@Track_Id ))
	   begin
	     if(@Name is not Null)
		  begin
		    update AcademicRecords.Track 
			set Name=@Name where Id=@Track_Id 
			print 'Edit Name Done Successfully'
		  end
		  if(@Description is not Null)
		  begin
		   update AcademicRecords.Track
			set Description=@Description where Id=@Track_Id 
			print 'Edit Description Done Successfully'
		  end
		 print 'Edit Done Successfully'
	   end
	   else
	   print 'This Track Does not exists go Add it First'
	end
	else
	print 'You are not a Manager'
	end try
	begin catch
	  print 'There an error in your Structure' 
	end catch
end

--exec sp_TrMager_Edit_Track 66,13,'MERN','ttttt'

--exec sp_TrMager_Edit_Track 49,13,'MERN','ttttt'

--exec sp_TrMager_Edit_Track 49,13,'MER'


-- training manager edit Intake


go
create or alter procedure sp_TrMager_Edit_Intake
@managerAccount_ID int,
@Intake_Id int,
@Name nvarchar(50)=Null,
@Intake_Year int =Null
as
begin 
	begin try
	if(exists (select * from UserManagement.TrainingManager where AccountId=@managerAccount_ID))
	begin
	   if(exists(select*from AcademicRecords.Intake where Id=@Intake_Id ))
	   begin
	     if(@Name is not Null)
		  begin
		    update AcademicRecords.Intake
			set Name=@Name where Id=@Intake_Id 
			print 'Edit Name Done Successfully'
		  end
		  if(@Intake_Year is not Null)
		  begin
		   update AcademicRecords.Intake
			set IntakeYear=@Intake_Year where Id=@Intake_Id 
			print 'Edit Year Done Successfully'
		  end
		 print 'Edit Done Successfully'
	   end
	   else
	   print 'This Intake Does not exists go Add it First'
	end
	else
	print 'You are not a Manager'
	end try
	begin catch
	  print 'There an error in your Structure' 
	end catch
end

--exec sp_TrMager_Edit_Intake 66,40,'In','2099'
--exec sp_TrMager_Edit_Intake 49,40,'In','2099'
--exec sp_TrMager_Edit_Intake 49,60,'In','2099'
--exec sp_TrMager_Edit_Intake 49,40,'innn'
-----------------------------------------------------------------------------
go
create or alter procedure sp_TrMager_Set_studentinTrackandintackandbranch
@std_id int,
@track_id int,
@branch_id int,
@intack_id int 
as
 begin
     begin try
			declare @ibi_ID int=-1 ;

			select @ibi_ID=id  from AcademicRecords.Branch_Track_Intake
			where BranchId=@branch_id and TrackId=@track_id and IntakeId=@intack_id
			
			if(@ibi_ID !=-1)
				begin
					if((select Brn_Track_IntakeId from AcademicRecords.Student where Id=@std_id)is  null)
					begin
						update AcademicRecords.Student
						set Brn_Track_IntakeId=@ibi_ID
						where Id=@std_id
						print 'Student Enrolled Succefully'
					end
					else 
						print 'This student Assigned to a track_intake_branch before'
					
				end
			else 
				print 'this branch or intake or track not exists'

	 end try
	 begin catch
		print 'error in your structure'
	 end catch
 end

 exec sp_TrMager_Set_studentinTrackandintackandbranch 35,10,15,50 
 exec sp_TrMager_Set_studentinTrackandintackandbranch 35,10,20,50 -- error

-- sp_CreateAccount  with strong username or pass 
go
create or alter procedure  sp_CreateAccount 
@username nvarchar(200),
@Password nvarchar(20),
@AccountId int output
as
begin
	begin try
	if(not exists (select id from UserManagement.Account 
		where UserName=@username))
		begin
			if((@username LIKE '[a-zA-Z0-9@]%' 
			AND LEN(@username) BETWEEN 5 AND 200)
			AND
			(@Password LIKE '%'
			AND LEN(@Password) BETWEEN 6 AND 20
			AND @Password LIKE '%[A-Z]%'     
			AND @Password LIKE '%[a-z]%'      
			AND @Password LIKE '%[0-9]%'     
			AND @Password LIKE '%[@#$%^&*!]%' 
			AND @Password NOT LIKE '% %')  )
			begin 
				insert into UserManagement.Account (UserName,Password)
				values(@username,@Password)
				set @AccountId=SCOPE_IDENTITY()
				print 'Account Added succesfully'
			end

			else
				print 'Your user name or  Password  not Strong'
		end
	else 
		print 'this user name alrady exists'
	end try
	begin catch 
	end catch
end
declare @id int  ;
exec sp_CreateAccount 'Ahmedweal','Mustafa!123',@id out
select @id
---------------------------------------------------
-- sp_ValidateUserLogin
go
create or alter procedure sp_ValidateUserLogin
@username nvarchar(200),
@password nvarchar(20),
@isvalid bit out
as
begin
	begin try
		if(exists (select Id from UserManagement.Account
		where UserName=@username and Password=@password))
		begin
			set @isvalid=1;
				print 'Valid User name and password'
		end
			else
			begin
				set @isvalid=0
				print 'invalid username or password'
			end
	end try 
	begin catch
	end catch
end

declare @istrue bit ;  
 exec sp_ValidateUserLogin 'Ahmedweal','mustafa!123',@istrue out
 select @istrue
 -----------------------------------------------------
 
 go

 create or alter proc sp_AddCoursetoInstructor
 @inst_id int ,
 @crc_id int 
 as
 begin
	begin try 
		if( (select InstructorId from AcademicRecords.Course where Id=@crc_id )is null)
			begin
				update AcademicRecords.Course
				set InstructorId =@inst_id
				where Id=@crc_id
				print 'Added Succefully'
			end
		else 
			print 'this Course allready enrolled to  instructor'
	end try 
	begin catch
		print 'error in your structure'
	end catch
 end

 exec sp_AddCoursetoInstructor 12,14

 -- sp_Create Course 

 go
 create or alter proc sp_CreateCourseByTRM
  @trmAccount_id int,
 @crs_Name nvarchar(50),
 @Description nvarchar(500),
 @MaxDegree int,
 @minDegre Int,
 @DurationHour int

 as
 begin
	begin try
		if(exists (select AccountId from UserManagement.TrainingManager where AccountId=@trmAccount_id))
		begin 
			if(not exists(select Crs_Name from AcademicRecords.Course where Crs_Name=@crs_Name))
			begin 
				insert into AcademicRecords.Course(Crs_Name,Description,MaxDegree,MinDegree,DurationHours) 
				values (@crs_Name,@Description,@MaxDegree,@minDegre,@DurationHour)

				print 'Course Added Succefully'
			end
			else
				print 'this course already exists'
		end
		else
		 print 'You are not a manager'
	end try
	begin catch
	end catch
 end
 exec sp_CreateCourseByTRM 49,'Comunication skills','How to camunicate with others',100,65,30
 exec sp_CreateCourseByTRM 49,'Comunication skillss','How to camunicate with others',100,65,30

 go
 create or alter proc sp_EditCourseByTRM
 @trmAccount_id int,
 @Crc_ID int,
 @crs_Name nvarchar(50)=null,
 @Description nvarchar(500)=null,
 @MaxDegree int=0,
 @minDegre Int=0,
 @DurationHour int=0

 as
 begin
	begin try
		if(exists (select AccountId from UserManagement.TrainingManager where AccountId=@trmAccount_id))
		begin 
			if( exists(select id from AcademicRecords.Course where id=@Crc_ID))
			begin 
				if(@crs_Name is not null)
					update AcademicRecords.Course set Crs_Name=@crs_Name  where Id=@Crc_ID
				if(@Description is not null)
					update AcademicRecords.Course set Description=@Description  where Id=@Crc_ID
				if(@MaxDegree=0)
				update AcademicRecords.Course set MaxDegree=@MaxDegree  where Id=@Crc_ID
				if(@minDegre=0)
					update AcademicRecords.Course set @minDegre=@minDegre  where Id=@Crc_ID
				if(@DurationHour =0)
					update AcademicRecords.Course set DurationHours=@DurationHour  where Id=@Crc_ID
				print 'Course Edit Succefully'
			end
			else
				print 'this course Not exists'
		end
		else
		 print 'You are not a manager'
	end try
	begin catch
	end catch
 end

 exec sp_EditCourseByTRM 49,14
 exec sp_EditCourseByTRM 49,14 ,'Cummunication','not have adescription'

 select * from AcademicRecords.Course

 ---------------------------------------------------------------------------
 go
 create or alter trigger verificationAccount
 on UserManagement.Account
 after insert
 as
 begin
	begin try
		declare @usern nvarchar(200);
		declare @pass nvarchar(20);
		select @usern =inserted.UserName,@pass = inserted.Password from inserted
		if(not exists  (select UserName from UserManagement.Account where UserName=@usern))
			begin
				if((@usern LIKE '[a-zA-Z0-9@]%' 
					AND LEN(@usern) BETWEEN 5 AND 200)
					AND
					(@pass LIKE '%'
					AND LEN(@pass) BETWEEN 6 AND 20
					AND @pass LIKE '%[A-Z]%'     
					AND @pass LIKE '%[a-z]%'      
					AND @pass LIKE '%[0-9]%'     
					AND @pass LIKE '%[@#$%^&*!]%' 
					AND @pass NOT LIKE '% %')  )
					begin 
						insert into UserManagement.Account (UserName,Password)
						values(@usern,@pass)
						print 'Account Added succesfully'
					end
				else
				print 'Your user name or  Password  not Strong'
			end
		else
			print 'This user name alrady exists'
		
	end try
	begin catch
		print 'this username Already Exists'
	end catch
 end

 insert into UserManagement.Account(UserName,Password)
 values( 'Mustafahafezz','Mustafa@123')

 alter table UserManagement.Account
 add constraint usernameunique unique (UserName)