CREATE DATABASE BDHR
GO

USE BDHR
GO

CREATE TABLE regions (
	region_id INT IDENTITY(1,1) PRIMARY KEY,
	region_name VARCHAR (25) DEFAULT NULL
);
GO

CREATE TABLE countries (
	country_id CHAR (2) PRIMARY KEY,
	country_name VARCHAR (40) DEFAULT NULL,
	region_id INT NOT NULL,
	FOREIGN KEY (region_id) REFERENCES regions (region_id) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE TABLE locations (
	location_id INT IDENTITY(1,1) PRIMARY KEY,
	street_address VARCHAR (40) DEFAULT NULL,
	postal_code VARCHAR (12) DEFAULT NULL,
	city VARCHAR (30) NOT NULL,
	state_province VARCHAR (25) DEFAULT NULL,
	country_id CHAR (2) NOT NULL,
	FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE TABLE jobs (
	job_id INT IDENTITY(1,1) PRIMARY KEY,
	job_title VARCHAR (35) NOT NULL,
	min_salary DECIMAL (8, 2) DEFAULT NULL,
	max_salary DECIMAL (8, 2) DEFAULT NULL
);
GO

CREATE TABLE departments (
	department_id INT IDENTITY(1,1) PRIMARY KEY,
	department_name VARCHAR (30) NOT NULL,
	location_id INT DEFAULT NULL,
	FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE TABLE employees (
	employee_id INT IDENTITY(1,1) PRIMARY KEY,
	first_name VARCHAR (20) DEFAULT NULL,
	last_name VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	phone_number VARCHAR (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id INT NOT NULL,
	salary DECIMAL (8, 2) NOT NULL,
	manager_id INT DEFAULT NULL,
	department_id INT DEFAULT NULL,
	FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);
GO

CREATE TABLE dependents (
	dependent_id INT IDENTITY(1,1) PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	relationship VARCHAR (25) NOT NULL,
	employee_id INT NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

INSERT INTO regions(region_name) VALUES ('Europe');
INSERT INTO regions(region_name) VALUES ('Americas');
INSERT INTO regions(region_name) VALUES ('Asia');
INSERT INTO regions(region_name) VALUES ('Middle East and Africa');

/*Data for the table countries */

INSERT INTO countries(country_name,region_id) VALUES ('ZW','Zimbabwe',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('AR','Argentina',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('AU','Australia',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('BE','Belgium',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('BR','Brazil',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CA','Canada',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CH','Switzerland',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CN','China',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('DE','Germany',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('DK','Denmark',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('EG','Egypt',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('FR','France',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('HK','HongKong',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IL','Israel',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IN','India',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IT','Italy',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('JP','Japan',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('KW','Kuwait',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('MX','Mexico',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('NG','Nigeria',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('NL','Netherlands',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('SG','Singapore',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('ZW','Zimbabwe',4);

INSERT INTO locations(street_address,postal_code,city,state_province,country_id) VALUES ('2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations(street_address,postal_code,city,state_province,country_id) VALUES ('2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations(street_address,postal_code,city,state_province,country_id) VALUES ('2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO locations(street_address,postal_code,city,state_province,country_id) VALUES ('147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO locations(street_address,postal_code,city,state_province,country_id) VALUES ('8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO locations(street_address,postal_code,city,state_province,country_id) VALUES ('Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations(street_address,postal_code,city,state_province,country_id) VALUES ('Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
SELECT * FROM locations

/*Data for the table jobs */

INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Public Accountant',4200.00,9000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Accounting Manager',8200.00,16000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Administration Assistant',3000.00,6000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('President',20000.00,40000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Administration Vice President',15000.00,30000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Accountant',4200.00,9000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Programmer',4000.00,10000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Marketing Representative',4000.00,9000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Sales Representative',6000.00,12000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_title,min_salary,max_salary) VALUES ('Stock Manager',5500.00,8500.00);


/*Data for the table departments */

INSERT INTO departments(department_name,location_id) VALUES ('Administration',1700);
INSERT INTO departments(department_name,location_id) VALUES ('Marketing',1800);
INSERT INTO departments(department_name,location_id) VALUES ('Purchasing',1700);
INSERT INTO departments(department_name,location_id) VALUES ('Human Resources',2400);
INSERT INTO departments(department_name,location_id) VALUES ('Shipping',1500);
INSERT INTO departments(department_name,location_id) VALUES ('IT',1400);
INSERT INTO departments(department_name,location_id) VALUES ('Public Relations',2700);
INSERT INTO departments(department_name,location_id) VALUES ('Sales',2500);
INSERT INTO departments(department_name,location_id) VALUES ('Executive',1700);
INSERT INTO departments(department_name,location_id) VALUES ('Finance',1700);
INSERT INTO departments(department_name,location_id) VALUES ('Accounting',1700);
SELECT * FROM departments

/*Data for the table employees */

INSERT INTO employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES ('Steven','King','steven.king@sqltutorial.org','515.123.4567','1987-06-17',4,24000.00,NULL,9);
INSERT INTO employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES ('Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','1989-09-21',5,17000.00,100,9);
INSERT INTO employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES ('Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569','1993-01-13',5,17000.00,100,9);
INSERT INTO employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES ('Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','1990-01-03',9,9000.00,102,6);
INSERT INTO employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES ('Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','1991-05-21',9,6000.00,103,6);
INSERT INTO employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES ('David','Austin','david.austin@sqltutorial.org','590.423.4569','1997-06-25',9,4800.00,103,6);
INSERT INTO employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES ('Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','1998-02-05',9,4800.00,103,6);
INSERT INTO employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES ('Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','1999-02-07',9,4200.00,103,6);
INSERT INTO employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES ('Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','1994-08-17',7,12000.00,101,10);
INSERT INTO employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES ('Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','1994-08-16',6,9000.00,108,10);
INSERT INTO employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES ('John','Chen','john.chen@sqltutorial.org','515.124.4269','1997-09-28',6,8200.00,108,10);
INSERT INTO employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES ('Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','1997-09-30',6,7700.00,108,10);
INSERT INTO employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES ('Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469','1998-03-07',6,7800.00,108,10);
INSERT INTO employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES ('Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','1999-12-07',6,6900.00,108,10);
SELECT * FROM employees
/*Data for the table dependents */

INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Penelope','Gietz','Child',206);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Nick','Higgins','Child',205);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Ed','Whalen','Child',200);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Jennifer','King','Child',100);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Johnny','Kochhar','Child',101);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Bette','De Haan','Child',102);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Grace','Faviet','Child',109);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Matthew','Chen','Child',110);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Joe','Sciarra','Child',111);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Christian','Urman','Child',112);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Zero','Popp','Child',113);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Karl','Greenberg','Child',108);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Uma','Mavris','Child',203);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Vivien','Hunold','Child',103);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('Cuba','Ernst','Child',104);
