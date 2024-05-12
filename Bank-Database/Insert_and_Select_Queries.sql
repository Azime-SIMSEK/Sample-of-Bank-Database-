
insert into marital_status(Marital_Status_Info)
values('single'),('married'),('divorced');

insert into card_types(Type_Info)
values('visa'),('master'),('amex');


-- for customers table data --
insert into customers (TC_Identity_Num, first_name, middle_name, last_name, birth_date, Marital_Status_ID, Addres, Phone_Num)
values ('12345678901', 'Ahmet', 'Ali', 'Yýlmaz', '1990-05-15', 2, 'Ýstanbul', '5551234567'),
       ('23456789012', 'Ayþe', NULL, 'Kaya', '1985-08-25', 3, 'Ankara', '5552345678');
insert into customers(TC_Identity_Num, first_name, middle_name, last_name, birth_date, Marital_Status_ID, Addres, Phone_Num)
values ('11111111111', 'Aslan',NULL, 'Ibrahimoðlu','1990-05-05',3,'Ýzmir', '05555555'),
	   ('11111122222', 'Banu','Beyza', 'Karan','1999-07-05',1,'Kayseri', '055555544'),
	   ('11113333333', 'Çaðan',NULL, 'Ülkü','2004-09-05',1,'Antalya', '0555550026'),
	   ('11111444444', 'Rabia',NULL, 'Özkan','2004-01-01',1,'Antalya', '055555550214'),
	   ('11111112345', 'Ýnci','Ýlkay', 'Erhan','1990-05-05',2,'Muðla', '055555525475'),
	   ('11111196666', 'Aysima',NULL, 'Þimþek','2030-05-05',1,'Ýstanbul', '055555552696'),
	   ('11111111999', 'Simay','Parlak', 'Þimþek','2040-05-05',1,'Ýzmir', '05555513478'),
	   ('11111284573', 'Mert','Yiðit', 'Ibrahimoðlu','1990-05-05',2,'Aydýn', '05552145555'),
	   ('11111111777', 'Sefa','Okyay', 'Kýlýç','1990-06-05',2,'Ankara', '05555551205'),
	   ('11111888888', 'Çaðatay',NULL, 'Ibrahimoðlu','1990-05-05',1,'Ýzmir', '05555555111');


-- for card tables data --
insert into cards (Card_Num, Expiry_Month, Expiry_Year, Security_Code, Card_Type_ID, customer_ID)
values ('1234567890123456', 12, 2025, '123', 1, 1),
       ('2345678901234567', 11, 2024, '456', 2, 2);
insert into cards (Card_Num, Expiry_Month, Expiry_Year, Security_Code, Card_Type_ID, customer_ID)
values ('1111111111111111', 1, 2029, '000', 2, 1),
	   ('1111111122222222', 2, 2027, '001', 3, 1),
	   ('1111113333333333', 1, 2030, '002', 1, 2),
	   ('1111111111111144', 3, 2029, '003', 1, 3),
	   ('1111111111111155', 4, 2024, '004', 2, 4),
	   ('1111111111111166', 5, 2025, '005', 3, 5),
	   ('1111111111111177', 6, 2026, '006', 2, 6),
	   ('1111111111111188', 7, 2027, '007', 1, 7),
	   ('1111111111111199', 7, 2027, '008', 2, 7),
	   ('1111111111119999', 9, 2029, '009', 3, 8),
	   ('1111111111100000', 10, 2030, '010',3, 9),
	   ('0000001111111155', 11, 2024, '110', 1,10),
	   ('1111000001111155', 11, 2024, '004', 2,11),
	   ('1112211200111255', 12, 2032, '004', 2,12),
	   ('1112211200111222', 12, 2032, '012', 3,12);


	   
	   -- SELECT  QUERIES--
	   
	   select*from cards inner join customers on cards.customer_ID = customers.customer_ID
				where cards.Card_Num in ('1111111111111144','1112211200111255');

	

	   select cards.Card_Num,cards.Expiry_Month,cards.Expiry_Year,cards.Security_Code from cards 
							inner join customers on cards.customer_ID = customers.customer_ID
							inner join card_types on cards.Card_Type_ID = card_types.Card_Type_ID
				where customers.customer_ID in(7) AND card_types.Type_Info in('visa');



	   select customers.first_name,cards.Card_Num,cards.Expiry_Month,cards.Expiry_Year,cards.Security_Code from cards 
							inner join customers on cards.customer_ID = customers.customer_ID
							inner join marital_status on customers.Marital_Status_ID = marital_status.Marital_Status_ID
				        where marital_status.Marital_Status_Info in('married');



	   select customers.TC_Identity_Num,customers.customer_ID,customers.first_name,customers.middle_name,
			  customers.last_name,customers.birth_date,customers.Marital_Status_ID,customers.Addres,customers.Phone_Num from customers
							inner join cards on customers.customer_ID = cards.customer_ID
						where cards.Expiry_Year in(2024);