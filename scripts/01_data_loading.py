#Import necessary libraries
import pyodbc
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Connect to my SQL Server
conn = pyodbc.connect(
    r'DRIVER={SQL Server};'
    r'SERVER=DESKTOP-IAH6M8J\SQLEXPRESS;'
    r'DATABASE=Life_Expectancy;'
    r'Trusted_Connection=yes;'
)

# Read the data and store it in a DataFrame
query = "SELECT * FROM Global_Terrorism_Dataset"
data_terrorism = pd.read_sql(query, conn)

# Close the connection
conn.close()

# General Overview
print('\nDimensions of the dataset:', data_terrorism.shape)
print('\nNames of the columns:')
print(data_terrorism.columns.tolist())
print("\nFirst Rows:")
print(data_terrorism.head())

#Drop columns that are not important for the analysis
columns_to_drop = ['event_id', 'approx_date', 'resolution','specificity', 'vicinity', 'criterion_1', 'criterion_2', 'criterion_3',
    'doubt_terrorism', 'alternative_attack_type', 'alternative_attack_type_txt',
    'attack_type_2', 'attack_type_2_txt', 'attack_type_3', 'attack_type_3_txt',
    'target_entity_1', 'target_1',
    'targtype2', 'targtype2_txt', 'targsubtype2', 'targsubtype2_txt', 'corp2', 'target2',
    'natlty2', 'natlty2_txt', 'targtype3', 'targtype3_txt', 'targsubtype3', 'targsubtype3_txt', 'corp3', 'target3',
    'natlty3', 'natlty3_txt', 'sub_group', 'gname2', 'gsubname2', 'gname3', 'gsubname3',
    'group_uncertainty_1', 'guncertain2', 'guncertain3',
    'claim_mode', 'claim_mode_txt', 'claim2', 'claimmode2', 'claimmode2_txt', 'claim3', 'claimmode3', 'claimmode3_txt',
    'competing_claims', 'weaptype2', 'weaptype2_txt', 'weapsubtype2',
    'weapsubtype2_txt', 'weaptype3', 'weaptype3_txt', 'weapsubtype3', 'weapsubtype3_txt', 'weaptype4', 'weaptype4_txt',
    'weapsubtype4', 'weapsubtype4_txt', 'property_damage', 'property_extent', 'property_extent_txt', 'property_value', 'property_comment',
    'diverted', 'ransom_note', 'additional_notes', 'source_1', 'source_2', 'source_3', 'database_source', 'international_logistics',
    'international_ideology', 'international_misc', 'international_any', 'related_attacks']
data_terrorism = data_terrorism.drop(columns=columns_to_drop)

print('\nRemaining columns:') 
print(data_terrorism.columns.tolist())
print('\nDimensions of the dataset after dropping columns:', data_terrorism.shape)

#check data type of each column
print('\nData types of the columns:')
print(data_terrorism.dtypes)#no need to change any data type

#Handle the missing values
missing_values = data_terrorism.isnull().sum().sort_values(ascending=False)
print('\nMissing values in the dataset;')
print(missing_values[missing_values > 0]) #some columns have a huge amount of missing values, let's drop the columns that does not have at least 50% of the data

threshold = len(data_terrorism) * 0.5
data_terrorism = data_terrorism.dropna(axis=1, thresh=threshold)
print("\nColumns left:")
print(data_terrorism.columns.tolist())
print("\nNew shape of the dataset:",data_terrorism.shape)#the dataset has been reduced

numeric_columns = data_terrorism.select_dtypes(include='number').columns
data_terrorism[numeric_columns] = data_terrorism[numeric_columns].fillna(data_terrorism[numeric_columns].median()) 
#We choose the median because is more robust and less affected by outliers

object_columns=data_terrorism.select_dtypes(include='object').columns
data_terrorism[object_columns]=data_terrorism[object_columns].fillna('Unknown')

#Check that there are no more missing values
print("\nMissing values after the dataset cleaning:")
print(data_terrorism.isnull().sum().sort_values(ascending=False)) #No more missing values

#Handle duplicated rows
duplicates = data_terrorism.duplicated().sum()
print(f"\nNumber of duplicated rows: {duplicates}")
data_terrorism = data_terrorism.drop_duplicates() #We remove duplicates
print("\nNew shape after removing duplicates:", data_terrorism.shape)

#New date column based on the columns year, month and day
data_terrorism['date'] = pd.to_datetime(data_terrorism[['year', 'month', 'day']], errors='coerce')
columns = data_terrorism.columns.tolist()
columns.insert(3, columns.pop(columns.index('date')))
data_terrorism = data_terrorism[columns]
print("\nColumns:")
print(data_terrorism.columns.tolist())
print(data_terrorism.dtypes) #Correctly implemented, with the appropiate data type

#New column 'number_of_victims'
data_terrorism['Total_victims'] = data_terrorism['n_killed'] + data_terrorism['n_wounded']

#Remove unconsistent data

# Detect rows with zeros in the 'year', 'month', and 'day' columns
invalid_dates = data_terrorism[(data_terrorism['month'] == 0) | (data_terrorism['day'] == 0)]
print(f"Number of rows with month or day equal to 0: {len(invalid_dates)}")
data_terrorism = data_terrorism[(data_terrorism['month'] != 0) & (data_terrorism['day'] != 0)]

#Too many rows with invalid values (-9 or -99) in columns like number_of_perpetrators, number_of_perpetrators_captured and claimed_responsibility
data_terrorism = data_terrorism.drop(columns=['number_of_perpetrators', 'perpetrators_captured', 'claimed_responsibility'])
print('\nNew shape of the dataset:', data_terrorism.shape)

#Column hostage_or_kidnapping have also inconsistencies (dummy variable has values of -9)
data_terrorism = data_terrorism[data_terrorism['hostage_or_kidnapping'] != -9]

#Show statistics of the data
victim_columns = ['n_killed', 'n_killed_us', 'n_killed_terrorists','n_wounded', 'n_wounded_us', 'n_wounded_terrorists']
victim_data = data_terrorism[victim_columns]
plt.figure(figsize=(10,5))
sns.boxplot(data=victim_data, orient="h")
plt.show()

#Detect outliers in the numeric data
Q1 = victim_data.quantile(0.25)
Q3 = victim_data.quantile(0.75)
IQR = Q3 - Q1
lower_bound = Q1 - 1.5 * IQR
upper_bound = Q3 + 1.5 * IQR
outliers = (victim_data < lower_bound) | (victim_data > upper_bound)
print(f"\nNumber of outliers in the dataset: {outliers.sum()}")
#I found that there are extreme values in the victim-related variables, 
# but they make sense since they represent very serious attacks. 
# So I decided not to remove these outliers and to keep them for the analysis.

#We order the dataset by the date, from oldest to newest attacks
data_terrorism = data_terrorism.sort_values(by='date')

#Statistical Summary of the cleaned dataset
print(data_terrorism.describe())

#Export the cleaned dataset to a CSV file
data_terrorism.to_csv('Cleaned_Global_Terrorism_Dataset.csv', index=False)