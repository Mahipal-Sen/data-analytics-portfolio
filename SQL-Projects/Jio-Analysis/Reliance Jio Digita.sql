show databases;

create database fingertips;

use fingertips;

create table Employee (
Emp_ID int(10),
First_Name varchar(10),
Last_Name varchar(10),
Dept_code int (3));

select * from employee;

insert into Employee (Emp_ID, First_Name, Last_Name, Dept_Code)
values
(248132604,"Shivam", "Deo",76),
(815242165,"Parijat", "Shankar",43),
(416122768,"rahul", "Srivastava", 66),
(960828909,"Kumar","Swamy",47),
(440361783,"Shankh","Khurana",23),
(851591490,"Swapnil", "Mehta", 43),
(668957687,"Arvind", "Chattejee",23),
(585068105,"Jalpesh", "Modi",33),
(379882096,"Kavita", "Yadav", 23),
(718929853,"Syed", "Zaheer", 66),
(873840890,"Sanjay", "Shukla",76),
(941877566,"Ragini", "Malhotra",33),
(998809976,"Javed","Khan", 23),
(669391133, "Vikram","Singh",43),
(861199021,"Ajay","Kumar",23),
(980140890,"Pankaj","Verma",43),
(750603819,"Roshan","Singh",47),
(558885983,"Sunaina","Yadav",76),
(392214056,"Bhavna","Sharma",66),
(164880802,"Pooja","Kumari",47);

select * from employee;


create table Department(
Dept_Code int (10),
Dept_Name varchar(25),
Dept_Budget int (12));

insert into Department (Dept_Code,Dept_Name,Dept_Budget)
values
(23,"Sales and Marketing",50000000),
(66,"Information Technology",100000000),
(43,"Customer Service",30000000),
(33, "Human Resources",20000000),
(76, "Finance and Accounting",40000000),
(47,"Operations",60000000);





# 1.What are the unique Last_Names from the Employee Table?

select distinct Last_Name  from employee; 

# 2.What is the total number of employees in the company?

select count(e.Emp_ID ) from employee e ;

# 3.What is the total budget for the company?

select sum(d.Dept_Budget ) from department d ;

# 4.What is the department code and budget for the "Operations" department?

select d.Dept_Code ,d.Dept_Budget from department d
where d.Dept_Name = 'Operations';

# 5.What is the total budget for the "Information Technology" and "Finance and Accounting" departments?

select sum(d.Dept_Budget ) from department d
where d.Dept_Name in ( 'Information Technology','Finance and Accounting') ;

# 6.Who are the employees working in the "Sales and Marketing" department?

select e.First_Name, e.Last_Name    from employee e
join department d
on d.Dept_Code=e.Dept_code 
where d.Dept_Name = 'Sales and Marketing';

# 7.What is the name of the employee with Emp_ID 718929853?

select e.First_Name , e.Last_Name from employee e
where e.Emp_ID = 718929853 ;

# 8.What is the budget for the "Customer Service" department?

select d.Dept_Budget  from department d
where d.Dept_Name ='Customer Service';

# 9.What is the total budget for all departments except "Operations"?

select sum(Dept_Budget)  from department d
where d.Dept_Name !='Operations';


# 10.What is the Emp_ID, First_Name and department_code of the employee with the last name "Shukla"?

select e.Emp_ID , e.First_Name ,e.Dept_code from employee e
where e.Last_Name = 'Shukla';

# 11.What is the average budget for the departments with Dept_Code 23 and 43?

select avg(d.Dept_Budget ) from department d
where d.Dept_Code  in ( 23 ,43) ;


# 12.How many employees are there whose first name starts with the letter "S"?

select count(*) from employee e 
where e.First_Name like 's%';

# 13.List the name of Employees whose First_name starts with "S".

select e.First_Name  from employee e 
where e.First_Name like 's%';


# 14.List the name of Employees whose First_name starts with "S" and ends with "A".

select e.First_Name from employee e
where e.First_Name like 's%a';

# 15.Fetch Top 3 records of all the Departments in descending order based on the budget of the department.

select d.Dept_Name,d.Dept_Budget   from department d 
order by d.Dept_Budget desc 
limit 3;

# 16.Fetch data of all employees from the employee table whose dept_code is an odd number

select * from employee e 
where e.Dept_code % 2= 1; 

# 17.Create a clone of the table employee with a name Clone_table and having two columns, one with full name and the other with the department code with an alias D_Code

create table Clone_table as 
select 
  concat(first_name,' ',last_name) full_name, dept_code D_Code  from employee   ;


select * from clone_table;

# 18.Delete employee details of "Ajay Kumar" from Clone_Table

delete  from clone_table  
where full_name ='Ajay Kumar';

# 19.The name of the employee "rahul Srivasatava" has a lower case 'r', make changes in the clone table so that the full_name is written as "Rahul Srivastava"

update clone_table set full_name ='Rahul Srivastava' 
where full_name = 'rahul Srivastava'; 

# 20.Convert Full_name from clone table into uppercase.
  
select UPPER(full_name) from clone_table ct ;


# 21.Fetch second to fifth record from the department table based on the Highest Budget.

select * from department d 
order by d.Dept_Budget desc 
limit 1,4;


# 22.The employee with the name "Jalpesh Modi" has decided to move into another department, delete the D_code value corresponding to "Jalpesh_Modi" from the clone_table

update clone_table ct set D_Code = null  where ct.full_name = 'Jalpesh Modi';

# 23.Change the name of the column D_Code to Department_code in clone table.

alter table clone_table rename  column D_code to Department_code   ;

# 24.Since no mathematical operation will be performed on emp_id in employee table, convert its data type from int to varchar

alter table employee modify column emp_id varchar(25);

# 25.The Company has decided to increase the budget of all the department by 10% , make changes accordingly to fetch old and new budget

select d.Dept_Budget Old_Budget, d.Dept_Budget*1.10 New_Budget from department d ;

# 26.What is the name of the department with the lowest budget?

select d.Dept_Name,d.Dept_Budget   from department d
where d.Dept_Budget=(
select min(Dept_Budget) from department d2 );

# 27.Who are the employees working in the departments with budgets greater than 40,000,000?

select e.First_Name, e.Last_Name    from employee e
join department d
on d.Dept_Code=e.Dept_code 
where d.Dept_Budget  >= 40000000 ;

# 28.What is the name of the department with the second highest budget?



select d.Dept_Name,d.Dept_Budget   from department d
order by d.Dept_Budget desc
limit 1,1;

# 29.How many employees are there in each department?

select d.Dept_Name,COUNT(e.First_Name ) from employee e
join department d
on d.Dept_Code=e.Dept_code 
group by dept_name ;

# 30.Create a view of Employees working in Sales and Marketing department only.

create view Sales_and_Marketing_Employee as
select e.* from employee e
join department d
on d.Dept_Code=e.Dept_code 
where d.Dept_Name = 'Sales and Marketing';





