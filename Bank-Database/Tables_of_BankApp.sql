

create database dbpd22_bankappdb

go


use dbpd22_bankappdb

go



drop table if exists customers;

drop table if exists marital_Status;

create table marital_status(
	Marital_Status_ID int primary key identity,
	Marital_Status_Info nvarchar(30) unique
)
go

drop table if exists cards;
drop table if exists card_types;
create table card_types(
	Card_Type_ID int primary key identity,
	Type_Info nvarchar(20) unique
)
go


create table customers(
	TC_Identity_Num nvarchar(11) unique, 
	customer_ID int primary key identity(1,1),
	first_name nvarchar(100) not null,
	middle_name nvarchar(100),
	last_name nvarchar(100) not null,
	birth_date date not null,
	Marital_Status_ID int foreign key references marital_status(Marital_Status_ID)not null,
	Addres nvarchar(100) not null,
	Phone_Num nvarchar(20) not null
)
go

drop table if exists cards;
create table cards(
	Card_ID int primary key identity(1,1),
	Card_Num nvarchar(16) unique,
	Expiry_Month int,
	Expiry_Year int,
	Security_Code nvarchar(4),
	Card_Type_ID int,
    customer_ID int,
    foreign key (Card_Type_ID) references card_types(Card_Type_ID),
    foreign key (customer_ID) references customers(customer_ID)
)