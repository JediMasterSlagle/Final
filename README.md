# Predicting Fatal Accidents 
[Google Slides](https://docs.google.com/presentation/d/1VzghETdmlK60Soo-7PjKGphlrD8UF2DXXCA79tSqfJ0/edit?usp=sharing)<br>
[Tableau Workbook](https://public.tableau.com/app/profile/josh.slagle/viz/AccidentDataFinal/Story1?publish=yes)<br>
[Heroku Prediction app](https://car-accident-prediction.herokuapp.com/)<br>

## Team Introduction
- Josh Slagle, jslagle1982@yahoo.com

- Darlene Penn, dyvonnep@gmail.com

- Sierra Dubois, sdubois@kent.edu


## Communication Protocol
Team communicates daily via Slack messages for progress updates on individual components; meets weekly via Zoom for group components, brain storming, problem solving, coding, etc. 


## Topic
Our topic will be surrounding automotive collision data, and predicting accidents based on a number of common conditions. We will analyze whether or not certain environmental conditions contribute to the frequency and/or severity of automotive accidents in the U.S.  We will be looking to see what impact the conditions play in how likely an accident is to result in fatalities, based on the weather, make & model of the vehicle, weight of the car, geographical region of the location, the light conditions and the time of the year (in months). We will exam the years of 2019 and 2020 to ensure we have a large enough data set to train the machine learning model. 

## Topic Selection
We decided on this topic after brainstorming different areas of interest for each group member.  It was revealed that one group member was employed in the automotive industry and was familiar with some aspects of collision data. They suggested car crashes and different factors that could influence them.  After a brief discussion, other group members stated an interest in the topic and we can to a concensus that car crash data would provide many avenues of analysis, so we would have a broad range of options to examine the data for desired outcomes. 

## Description of Source Data
One of our main sources of data will be from the NATIONAL HIGHWAY TRAFFIC SAFETY ADMINISTRATION (NHTSA) and their Crash Report Sampling System (CRSS).  Crash Report data collected by law enforcement agencies are obtained by NHTSA coders and interpreted into a confidential electronic data file.  Personal information such as names addresses, licence and registgration information is removed, and the dataset is coded into a common format using 120 elements.  After being validated for consistency, the documentation becomes available to the public.  We will be using a selection of data for 2019 and 2020. 


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

#### [2019 Data](https://www.nhtsa.gov/file-downloads?p=nhtsa/downloads/CRSS/2019/)
#### [2020 Data](https://www.nhtsa.gov/file-downloads?p=nhtsa/downloads/CRSS/2020/)

  - We used accident.csv and vehicle.csv for our analysis 
  - We narrowed down the files to inlcude only columns we believe could likely affect car crash fatalities 

### Transform Data

  - Outcome column was created from the MAX_SEV column 
  - If MAX_SEV = 4 (Fatal Crash), then outcome = 1 

#### accident2019 data transformation
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/ETL/images/transform_accident2019_data.png) 
#### accident2020 data transformation
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/ETL/images/transform_accident2020_data.png )
#### vehicle2019 data transformation
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/ETL/images/transform_vehicle2019_data.png) 
#### vehicle2020 data transformation
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/ETL/images/transform_vehicle2020_data.png) 

### Load Data into Postgresql Database

#### Create fatal_accident_db in pgAdmin
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/Database/ERD/fatal_accident_db.png) 

#### Create accident2019 and accident2020 tables
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/Database/ERD/create_accident_tables.png) 

#### Create vehicle2019 and vehicle2020 tables
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/Database/ERD/create_vehicle_tables.png) 

#### ERD 
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/Database/ERD/fatal_accident_db_ERD.png) 

### Upload Data

## Machine Learning Process

X: outcome <br />
y: region, month, light_condtion, weather, make_and_model, year

Started with a Classification Model

#### Classfication Model Results
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/Machine%20Learning/images/classification_model.png) 

Due to the the majority of accidents being non-fatal, are dataset is greatly skewed. Thus we decided to test models that would help balance the data. See below the results of multiple models.

#### Native Random Oversampling Results
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/Machine%20Learning/images/native_random_oversampling.png) 

#### Smote Oversampling Results
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/Machine%20Learning/images/smote_oversampling.png) 

#### Undersampling Results
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/Machine%20Learning/images/undersampling.png) 

#### Combination Sampling (Over and Under) Results

#### BalancedRandomForestClassifier Results

#### BorderlineSMOTE Results

## Creating Flask App for Model
The purpose of this app is to give an interactive experience with our machine learning model. Due to project time constraints, we created a new model that didn't include make_and_model and year. Both variables have too many options to write into the html code (make_and_model with 500+ and year 90+). We still used the BalancedRandomForestClassifier model for the heroku app.

X: outcome <br />
y: region, month, light_condtion, weather

#### BalancedRandomForestClassifier Results
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/Machine%20Learning/Final%20Model/images/final_model_heroku_app_results.png)

#### Save the Model using Pickle
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/Machine%20Learning/Final%20Model/images/pickle.png)

## Deploy App using Heroku

Link to App: https://car-accident-prediction.herokuapp.com/

## Dashboard 

### Dashboard Rough Draft
![alt text](https://github.com/JediMasterSlagle/Final/blob/main/Visuals/Dashboard%20Sketch.png) 


### Dashboard Final Version
![final dashboard](Visuals/Dashboard.png)

