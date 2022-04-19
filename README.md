# Predicting Fatal Accidents 
[Google Slides] (https://docs.google.com/presentation/d/1VzghETdmlK60Soo-7PjKGphlrD8UF2DXXCA79tSqfJ0/edit?usp=sharing)<br>
[Tableau Workbook]  (https://public.tableau.com/app/profile/josh.slagle/viz/AccidentDataFinal/Story1?publish=yes)

## Team Introduction
- Josh Slagle, jslagle1982@yahoo.com

- Darlene Penn, dyvonnep@gmail.com

- Sierra Dubois, sdubois@kent.edu


## Communication Protocol
Team communicates daily via Slack messages for progress updates on individual components; meets weekly via Zoom for group components, brain storming, problem solving, coding, etc. 


## Topic
Our topic will be surrounding automotive collision data, and predicting accidents based on a number of common conditions. We will analyze whether or not certain environmental conditions contribute to the frequency and/or severity of automotive accidents in the U.S.  We will be looking to see what impact the conditions play in how likely an accident is to result in fatalities, based on the weather, make & model of the vehicle, weight of the car, geographical region of the location, the light conditions and the time of the year (in months). We will exam the years of 2016-2020 to ensure we have a large enough data set to train the machine learning model. 

## Topic Selection
We decided on this topic after brainstorming different areas of interest for each group member.  It was revealed that one group member was employed in the automotive industry and was familiar with some aspects of collision data. They suggested car crashes and different factors that could influence them.  After a brief discussion, other group members stated an interest in the topic and we can to a concensus that car crash data would provide many avenues of analysis, so we would have a broad range of options to examine the data for desired outcomes. 

## Description of Source Data
One of our main sources of data will be from the NATIONAL HIGHWAY TRAFFIC SAFETY ADMINISTRATION (NHTSA) and their Crash Report Sampling System (CRSS).  Crash Report data collected by law enforcement agencies are obtained by NHTSA coders and interpreted into a confidential electronic data file.  Personal information such as names addresses, licence and registgration information is removed, and the dataset is coded into a common format using 120 elements.  After being validated for consistency, the documentation becomes available to the public.  We will be using a selection of data from 2016 to 2020. 


## Questions for Analysis
We hope to answer some of the following questions with our analysis:
- Are some make and models of vehicles more prone to fatal accidents?
- What kinds of weather conditions have the greatest impact on the frequency and severity of vehicle accidents?
- Are some parts of the country less safe for driving based on the number of fatal accidents occurring annually, and what elements are influencing that fatal accident rate?
- Can we predict whether an accident will be fatal if we have the given conditions at that moment, like the make and model of the car, the current weather, and the location of the driver and time of the year?
- Which factors increase the rate of fatality vs. non-fatal accidents?

## ETL Process

### Extract Data
  - Data was taken from NHTSA website

#### Link to 2019 Data
https://www.nhtsa.gov/file-downloads?p=nhtsa/downloads/CRSS/2019/
#### Link to 2020 Data
https://www.nhtsa.gov/file-downloads?p=nhtsa/downloads/CRSS/2020/

  - We used accident.csv and vehicle.csv for our analysis 
  - We narrowed down the files to inlcude only columns we believe could likely affect car crash fatalities 

### Transform Data

  - Outcome column was created from the MAX_SEV column 
  - If MAX_SEV = 4 (Fatal Crash), then outcome = 1 

#### accident2019 data transformation
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/ETL%20Process/images/transform_accident2019_data.png) 
#### accident2020 data transformation
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/ETL%20Process/images/transform_accident2020_data.png )
#### vehicle2019 data transformation
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/ETL%20Process/images/transform_vehicle2019_data.png) 
#### vehicle2020 data transformation
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/ETL%20Process/images/transform_vehicle2020_data.png) 

### Load Data into Postgresql Database

#### Create fatal_accident_db in pgAdmin
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/ERD/fatal_accident_db.png) 

#### Create accident2019 and accident2020 tables
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/ERD/create_accident_tables.png) 

#### Create vehicle2019 and vehicle2020 tables
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/ERD/create_vehicle_tables.png) 

#### ERD 
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/ERD/fatal_accident_db_ERD.png) 

### Upload Data

## Machine Learning Process

X: outcome /n
y: region, month, light_condtion, weather , make_and_model, year

Started with a Classification Model

#### Classfication Model Results
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/Machine%20Learning/images/classification_model.png) 

Due to the the majority of accidents being non-fatal, are dataset is greatly skewed. Thus we decided to test models that would help balance the data.





## Database

Our database was created by a join of 4 .csv files from the NHTSA.  (Accidents 2019, Accidents 2020, Vehicles 2019 and Vehicles 2020. After dropping unneeded columns, and adding a column for the outcome of "Fatal" vs "Non-Fatal", we produced a database to use with our machine learning model. 

## Machine Learning Model

In order to compensate for the skewed data (the vast majority of accidents are non-fatal) we used the Balanced Random Forest Classifier to attemp to predict whether an accident would be fatal or not, based off known conditions of time of day, month of year, region of the U.S., light conditions and weather conditions.

