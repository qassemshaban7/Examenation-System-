-- sp_AddNewStudent

go
create or alter Procedure SP_AddNewStudent 
@fname nvarchar(50),
@Lname nvarchAR(50),
@City  nvarchar(50),
@zipcode int,
@phone int ,
@Gender char(1),
@BirthDate date ,
@manager_Acc_Id int

as
begin
	begin try 
		if(exists(select AccountId from UserManagement.TrainingManager where AccountId=@manager_Acc_Id))
			begin
			if(not exists (select Fname,Lname from AcademicRecords.Student where Fname=@fname and Lname=@Lname))
				begin
				insert into AcademicRecords.Student (Fname,Lname,City,ZibCode,Phone,Gender,BirthDate)
				values(@fname,@Lname,@City,@zipcode,@phone,@Gender,@BirthDate)
	
				print 'Student Inserted Succefully'
				end
			else
				begin
					print concat( 'there is Student with firstname : ',@fname,' and last name :',@Lname)
				end
			end
		else
			print 'Your ar not a manager'
	end try
	begin catch

		Print 'There an error in your Structure'
	end catch

end

exec SP_AddNewStudent 'Ahmed','hussain','cairo',2056,26654839,'F','2000-02-11',49

---------------------------------------------------

-- sp_AddAccountToStudent 
go 
create or alter procedure sp_AddAccountToStudent
@username nvarchar(200),
@Password nvarchar(20),
@std_Id int 
as
begin
	begin try
		begin
			if(exists(select s.Id from AcademicRecords.Student s where s.Id = @std_Id))
			begin
				if( (select s.AccountId from AcademicRecords.Student s where s.Id = @std_Id) is null  )
					begin
						 DECLARE @NewAccountId INT;
					insert into UserManagement.Account 
					values(@username,@Password)
					 SET @NewAccountId = SCOPE_IDENTITY();
					update AcademicRecords.Student 
					set AccountId=@NewAccountId 
					where Id=@std_Id
						print 'Account  added succefully to Student'
					end
					else 
						print 'this Student already has Account'
				end
			else print 'Student not Exist in your DB'
		end
	end try
	begin catch
		print 'There an error in your Structure'
	end catch
end 

   exec sp_AddAccountToStudent 'AhmedHus','1234',35
  ------------------------------------------------------------------------
  -- Sp_AddInstructor
  go

create or alter procedure Sp_AddInstructor 
@fname nvarchar(50),
@Lname nvarchAR(50),
@City  nvarchar(50),
@zipcode int,
@phone int ,
@Gender char(1),
@BirthDate date ,
@salary float 
as
begin
	begin try
	      if(not exists (select Fname,Lname from UserManagement.Instructor where Fname=@fname and Lname=@Lname))
			begin
				insert into UserManagement.Instructor (Fname,Lname,City,ZibCode,Phone,Gender,BirthDate,Salary)
					values(@fname,@Lname,@City,@zipcode,@phone,@Gender,@BirthDate,@salary)
				print 'Instrucor added succefully'
			end
			else
			begin
				print concat( 'there is instructor with firstname : ',@fname,' and last name :',@Lname)
			end
	end try
	begin catch
			Print 'There an error in your Structure'
	end catch
end

--Sp_AddInstructor 'ramez','Noshy','cairo',2056,26654839,'F','2000-02-11',20000

  ---------------------------------------------------------------------------------------
  -- sp_AddAccountToinstructor
  go
  create or alter procedure sp_AddAccountToinstructor
@username nvarchar(200),
@Password nvarchar(20),
@Inst_Id int 
as
begin
	begin try
	if(exists(select i.Id from UserManagement.Instructor i where i.Id = @Inst_Id))
		begin
			if( (select i.AccountId from UserManagement.Instructor i where i.Id = @Inst_Id) is null  )
				begin
				 DECLARE @NewAccountId INT;

                INSERT INTO UserManagement.Account (UserName, Password)   
                 VALUES (@username, @Password);
				 SET @NewAccountId = SCOPE_IDENTITY();

				   UPDATE UserManagement.Instructor
					SET AccountId = @NewAccountId
					WHERE Id = @Inst_Id;
                PRINT 'Account added successfully';
				end 
				else
				print 'this Instructor already has Account'

		end
		else
		print 'Instructor not Exist in your DB'
	end try
	begin catch
		print 'There an error in your Structure'
	end catch
end 

 exec sp_AddAccountToinstructor 'Ramez123',1234,11

select * from UserManagement.Instructor where Fname='ramez'


----------------------------------------------------------
---sp_ADDTraining_Manager
go
create Procedure sp_ADDTraining_Manager
 @fname nvarchar(50),@lname nvarchar(50)
 as
 begin
 begin try
	      if(not exists (select Fname,Lname from UserManagement.TrainingManager where Fname=@fname and Lname=@Lname))
			begin
				insert into UserManagement.TrainingManager(Fname,Lname)
					values(@fname,@Lname)
				print 'Training Manager added succefully'
			end
			else
			begin
				print concat( 'there is Training Manager with firstname : ',@fname,' and last name :',@Lname)
			end
	end try
	begin catch
			Print 'There an error in your Structure'
	end catch
 end

 --sp_ADDTraining_Manager 'mostafa','hafez'
 ------------------------------------------------------------------
  go
  create or alter procedure sp_AddAccountToTraining_manager 
@username nvarchar(200),
@Password nvarchar(20),
@tr_m_Id int 
as
begin
	begin try
	if(exists(select tm.Id from UserManagement.TrainingManager tm  where tm.Id = @tr_m_Id))
		begin
			if( (select tm.AccountId from UserManagement.TrainingManager tm where tm.Id = @tr_m_Id) is null  )
				begin
				 DECLARE @NewAccountId INT;
				insert into UserManagement.Account 
				values(@username,@Password)
				 SET @NewAccountId = SCOPE_IDENTITY();
				update UserManagement.TrainingManager 
				set AccountId=@NewAccountId
				where Id=@tr_m_Id
					print 'Account added succefully'
				end
				else 
					print 'this TrainingManager already has Account'
		end
		else print 'TrainingManager not Exist in your DB'
	end try
	begin catch
		print 'There an error in your Structure'
	end catch
end 

 exec sp_AddAccountToTraining_manager 'mostafa123456',123546,6

 select * from UserManagement.TrainingManager where Fname='mostafa'
 -----------------------------------------------------------------
 -- training manager add branch
 go
create or alter procedure sp_TrMager_Add_Branch
@managerAccount_ID int,
@Name nvarchar(50),
@Location nvarchar(50)
as
begin
	begin try
		if(exists (select * from UserManagement.TrainingManager where AccountId=@managerAccount_ID))
		begin
		if(not exists (select Name from AcademicRecords.Branch where Name=@Name))
			begin
			insert into AcademicRecords.Branch(Name,Location)
			values (@Name,@Location)
					print 'Branch added successfuly'
			end
			else print 'This branch added before'
		end
		else
			print 'You are not a Manager'
	end try
	begin catch
		print 'error in your structure'
	end catch
end

--exec sp_TrMager_Add_Branch 49,'Benisuef Branch','benisuef - East '

--exec sp_TrMager_Add_Branch 66,'Benisuef Branch','benisuef - East '

-- training manager add Track
go
-- training manager add branch
create or alter procedure sp_TrMager_Add_Branch
@managerAccount_ID int,
@Name nvarchar(50),
@Location nvarchar(50)
as
begin
	begin try
		if(exists (select * from UserManagement.TrainingManager where AccountId=@managerAccount_ID))
		begin
		if(not exists (select Name from AcademicRecords.Branch where Name=@Name))
			begin
			insert into AcademicRecords.Branch(Name,Location)
			values (@Name,@Location)
					print 'Branch added successfuly'
			end
			else print 'This branch added before'
		end
		else
			print 'You are  not a Manager'
	end try
	begin catch
		print 'error in your structure'
	end catch
end

exec sp_TrMager_Add_Branch 49,'Benisuef Branch','benisuef - East '

exec sp_TrMager_Add_Branch 66,'Benisuef Branch','benisuef - East '

go
create or alter procedure sp_TrMager_Add_Track
@managerAccount_ID int,
@Name nvarchar(50),
@Description nvarchar(200)
as
begin
	begin try
       if(exists (select * from UserManagement.TrainingManager where AccountId=@managerAccount_ID))
		begin
		  if(not exists (select Name from AcademicRecords.Track where Name=@Name))
			begin
				insert into AcademicRecords.Track(Name,Description)
				values (@Name,@Description)
		   		print 'Track added successfuly'
			end
	      else
			print 'This Track added before'
		end
	  else
			print 'You are not a Manager'
	end try
	begin catch
		print 'error in your structure'
	end catch
end

--exec sp_TrMager_Add_Track 66,'MERN',' “MERN” stands for MongoDB, Express, React, and Node. js'
--exec sp_TrMager_Add_Track 49,'MERN',' “MERN” stands for MongoDB, Express, React, and Node. js'

-- training manager add Intake
go
create or alter procedure sp_TrMagerAddIntake
@managerAccount_ID int,
@Name nvarchar(50),
@Intake_Year int
as
begin
	begin try
       if(exists (select * from UserManagement.TrainingManager where AccountId=@managerAccount_ID))
		begin
		  if(not exists (select Name from AcademicRecords.Intake where Name=@Name))
			begin
				insert into AcademicRecords.Intake(Name,IntakeYear)
				values (@Name,@Intake_Year)
		   		print 'Intake added successfuly'
			end
	      else
			print 'This Intake added before'
		end
	  else
			print 'You are not a Manager'
	end try
	begin catch
		print 'error in your structure'
	end catch
end

--exec sp_TrMager_Add_Track 66,'Intake 91',2055
--exec sp_TrMager_Add_Track 49,'Intake 91',2055

-- training manager edit branch
go
create or alter proc sp_TrMagerEditBranch
@managerAccount_ID int,
@branch_Id int,
@Name nvarchar(50)=Null,
@Location nvarchar(50)=Null
as
begin 
	begin try
	if(exists (select * from UserManagement.TrainingManager where AccountId=@managerAccount_ID))
	begin
	   if(exists(select*from AcademicRecords.Branch where Id=@branch_Id ))
	   begin
	     if(@Name is not Null)
		  begin
		    update AcademicRecords.Branch 
			set Name=@Name where Id=@branch_Id 
			print 'Edit Name Done Successfully'
		  end
		  if(@Location is not Null)
		  begin
		   update AcademicRecords.Branch
			set Location=@Location where Id=@branch_Id 
			print 'Edit Location Done Successfully'
		  end
		 print 'Edit Done Successfully'
	   end
	   else
	   print 'This Branch Does not exists go Add it First'
	end
	else
	print 'You are not a Manager'
	end try
	begin catch
	  print 'There an error in your Structure' 
	end catch
end

--exec sp_TrMager_Edit_Branch 66,14,'Luxoor Branch','Luxoooor'

--exec sp_TrMager_Edit_Branch 49,14,'Luxoor Branch','Luxoooor'

--exec sp_TrMager_Edit_Branch 49,14,'Luxoor Branch'
