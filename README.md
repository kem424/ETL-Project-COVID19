# ETL Project
2020-04-24

This project's goal is to apply the acquired ETL (extract, transform, load) learnings in class to a topic of our choice.<br/>
The group members are:
- Kendall Marquard
- Smiti Swain
- Luis Ramirez
- Salvador Neves
- Tejas

The group has decided to focus this project on the major topic of the moment - Corona Virus / Covid-19.


# Data Extraction:

<ins>**Country Table**</ins><br/>
The data source is a json file from https://worldpopulationreview.com/
The json library was used to handle the file.We looped through the file to append the values to arrays previously created. From there we have creaated a Data Frame

<ins>**State Table**</ins><br/>
The data source is wikipedia and we have pandas.read_html to scrape the table information directly from the website.

<ins>**Country_Cases Table**</ins><br/>
For the Country_Cases table the data source was an API. The API end point is https://api.covid19api.com/country/{country} with the start and end date as parameters.
Used the Country_ID column from the Country Table to do call this API for every single country between January 22, 2020 and April 24, 2020.



# Data Transformation:

<ins>**Country Table**</ins><br/>
Since the data source for this table was a json file, we have only selected the necessary fields so there was no need to transform this data besides creating a Pandas Data Frame with friendly names and teh Country_ID as the index 

<ins>**State Table**</ins><br/>
For this table since the data was scraped from wikipedia, we had do a few things:
1- The table had to levels of column headers so we had to get rid of the top one
2- Drop columns we don't care about
3- Rename columns to friendly names
4- Find a dictionary with state abreviations and names, make it a dataframe and merge with the previous data frame to add abreviations to the State Table.


<ins>**Country_Cases Table**</ins><br/>
For the Country_Case Table we had a small issue with the API which was that for some Countries the level of information was down to the city. So in order to fix this issue, we have use an aggregator function, we grouped by Country and date and did the sum of the confirmed, deaths, recovered and active cases.
Besides that we just had to convert the timestamp returned by the API into a Data format and set CountryID and Date as the index
