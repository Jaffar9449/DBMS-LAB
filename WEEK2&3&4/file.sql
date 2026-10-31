create database bank;
use bank;

create table branch(
bname varchar(20) primary key,
location varchar(20),
assets int);
desc branch;

create table account(
acc_num int primary key,
bname varchar(20) not null,
balance int,
foreign key(bname) references branch(bname));
desc account;

create table customer(
cname varchar(20) primary key,
street varchar(20),
city varchar(20));
desc customer;

create table depositer(
cname varchar(20) not null,
acc_num int, foreign key(cname) references customer(cname));
desc depositer;

create table loans(
loan_num int primary key,
bname varchar(20) not null,
amount int);
desc loans;

create table borrower
(cname varchar(20) not null,
loan_num int,foreign key(cname) references customer(cname),
foreign key(loan_num) references loans(loan_num));

insert into branch values
("SBI_chamrajpet","Bangalore",50000),
("SBI_ResidencyRoad","Bangalore",10000),
("SBI_ShivajiRoad","Bombay",20000),
("SBI_ParlimentRoad","Delhi",10000),
("SBI_Jantarmantar","Delhi",20000);


insert into account values
(1,"SBI_chamrajpet",2000),
(2,"SBI_ResidencyRoad",5000),
(3,"SBI_ShivajiRoad",6000),
(4,"SBI_ParlimentRoad",9000),
(5,"SBI_Jantarmantar",8000),
(6,"SBI_ShivajiRoad",4000),
(8,"SBI_ResidencyRoad",4000),
(9,"SBI_ParlimentRoad",3000),
(10,"SBI_ResidencyRoad",5000),
(11,"SBI_Jantarmantar",2000);

insert into customer values
("Avinash","Bull_temple_Road","Bangalore"),
("Dinesh","Bannerghatta_Road","Bangalore"),
("Mohan","NationalCollege_Road","Bangalore"),
("Nikil","Akbar_Road","Delhi"),
("Ravi","Prithviraj_Road_Road","Delhi");


insert into depositer values
("Avinash",1),("Dinesh",2),("Nikil",3),("Ravi",5),("Avinash",8),("Nikil",9),("Dinesh",10),("Nikil",11);

insert into loans values
(1,"SBI_chamrajpet",1000),(2,"SBI_ResidencyRoad",2000),(3,"SBI_ShivajiRoad",3000),(4,"SBI_ParlimentRoad",4000),(5,"SBI_Jantarmantar",5000);

insert into borrower values
("Avinash",1),
("Dinesh",2),
("Mohan",3),
("Nikil",4),
("Ravi",5);

select bname, assets/100000 as "assets_in_lakhs" from branch;

SELECT d.cname
FROM Depositer d
JOIN account a ON d.acc_num = a.acc_num
GROUP BY d.cname, a.bname
HAVING COUNT(d.acc_num) >= 2;

CREATE VIEW Branch_Loan_Sum AS
SELECT bname, SUM(amount) AS TOTAL_LOAN_AMOUNT
FROM Loans
GROUP BY bname;

SELECT *  FROM Loans ORDER BY AMOUNT DESC;


SELECT cname FROM Borrower
UNION
SELECT cname FROM Depositer;



UPDATE account
SET BALANCE = BALANCE * 1.05;


select * from account;




