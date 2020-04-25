drop table if exists US_States_Cases;
drop table if exists Index_prices;
drop table if exists Country_cases;
drop table if exists US_Unemployment_Stats;
drop table if exists Hospital_Beds;
drop table if exists gas_price;
drop table if exists Country;
drop table if exists State;


Create table Country
(Country_ID           char(2) primary key,
Country_Name		  varchar,
Population            Bigint
);


Create table State
(State_ID           char(2) primary key,
State_Name		  	varchar,
Population            Bigint
);


Create table US_States_Cases
(Report_Date          date,
country				  char(2),
State_ID              char(2),
Positive_Cases        Int,
Negative_Cases        Int,
Pending_Cases         Int,
Deaths                Int,
Total_Test_Results    Int,
ID                    text primary key,
UNIQUE (Report_Date,State_ID),
FOREIGN KEY(State_ID) REFERENCES State(State_ID));

Create table Index_prices
("Date"			Date,
 "Open"			Bigint,
 "High"			Bigint,
 "Low"			Bigint,
 "Close"		Bigint,
 "Adj Close"	Bigint,
 "Volume"		Bigint,	
 "Country"		Char(2),
 "Ticker"		Char(8),
 "Index_Name" 	Varchar,
FOREIGN KEY("Country") REFERENCES Country(country_ID));
 
Create table Country_Cases
(ID                     Int primary key,
Report_date          	date,
country_ID				char(2),
Total_cases       		Int,
new_cases     			Int,
total_Deaths            Int,
new_deaths  			Int,
Total_cases_per_million float,
new_cases_per_million   float,
total_Deaths_per_million float,
new_deaths_per_million  float,
total_tests 			bigint,
new_tests 				bigint,
total_tests_per_thousand float,
new_tests_per_thousand float,
UNIQUE (Report_Date,country_ID),
FOREIGN KEY(country_ID) REFERENCES Country(country_ID));
	

Create table US_Unemployment_Stats
(Report_Month         	varchar,
State_ID              	char(2),
rate        		  	float,
High_date        		varchar,
High_rate         		varchar,
Low_date        		varchar,
Low_rate         		varchar,
UNIQUE (Report_Month,State_ID),
FOREIGN KEY(State_ID) REFERENCES State(State_ID));


Create table Hospital_Beds
(State_ID              	char(2),
Beds			      int,
FOREIGN KEY(State_ID) REFERENCES State(State_ID));

Create table gas_price
(date varchar,
state varchar,
avg_national float,
state_price float,
state_id char(2),
FOREIGN KEY(State_ID) REFERENCES State(State_ID));
 
