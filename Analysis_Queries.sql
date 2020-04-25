--US States Cases and Hospital Beds (per K population)
 select sc.country,s.state_name,s.population,sum(sc.positive_cases) as "Total_positive_cases",
 sum(sc.deaths) as "total_deaths",max(h.beds) as "Hospital_beds"
 from US_States_Cases sc,State s,Hospital_Beds h
  where sc.state_id = s.state_id
  and h.state =  s.state_id 
  group by sc.country,s.state_name,s.population
  order by 4 desc ;
 
--US States Cases and Unemployment rate for march 2020
  select us.report_month,s.State_name,s.population,max(rate) as Unemployment_rate,
  sum(sc.positive_cases) as "Total_positive_cases",
 sum(sc.deaths) as "total_deaths"
  from US_Unemployment_Stats us,State s,US_States_Cases sc
  where us.state_id = s.state_id 
  and sc.state_id = us.state_id 
  and sc.report_date between '01-Mar-2020' and '31-mar-2020'
  group by us.report_month,s.State_name,s.population
  order by 4 desc;

-- Weekly Gas prices
 select gp.date,s.state_name,gp.avg_national,gp.state_price from 
 gas_price gp,state s
 where gp.state_id = s.state_id
 order by 4 desc;
 
 -- Country Cases Vs Index price change
 select cc.report_date,c.country_name,ip."Index_Name",ip."Close", 
 cc.total_cases,cc.total_deaths
 from Index_prices ip,country c,country_cases cc
 where ip."Country" = c.country_id
 and ip."Country" = cc.country_id
 and cc.report_date = ip."Date" 
 order by 1 desc
 
 

 
