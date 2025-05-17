#Import necessary libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import plotly.express as px


# Import the cleaned data
Cleaned_Global_Terrorism_data = pd.read_csv("data/Cleaned_Global_Terrorism_Dataset.csv")

# Show the first 5 rows of the DataFrame to see if the data was loaded correctly. and we check that in fact the dataset is cleaned
print('\nFirst 5 rows of the cleaned dataset:')
print(Cleaned_Global_Terrorism_data.head())

print('\nMissing values per column:')
print(Cleaned_Global_Terrorism_data.isnull().sum())

print('\nData types:')
print(Cleaned_Global_Terrorism_data.dtypes)

print('\nStatistics of the data:')
print(Cleaned_Global_Terrorism_data.describe())

#1. EXPLORATORY DATA ANALYSIS
sns.set_style("whitegrid")
plt.rcParams['figure.figsize'] = (12, 6)
plt.rcParams['axes.titlesize'] = 18
plt.rcParams['axes.titleweight'] = 'bold'
plt.rcParams['axes.labelsize'] = 14
plt.rcParams['xtick.labelsize'] = 12
plt.rcParams['ytick.labelsize'] = 12

#1 How have terrorist attacks evolved over the years?
attacks_year = Cleaned_Global_Terrorism_data.groupby('year').size()
plt.figure(figsize=(12, 6))
sns.lineplot(x=attacks_year.index, y=attacks_year.values, marker='o', color='crimson')
plt.title("Terrorist Attacks Over the Years", fontsize=18, fontweight='bold')
plt.xlabel("Time", fontsize=14)
plt.ylabel("Number of Attacks", fontsize=14)
plt.xticks(rotation=45)

for x, y in zip(attacks_year.index, attacks_year.values):
    plt.text(x, y + 500, str(y), ha='center', va='bottom', fontsize=8)

plt.tight_layout()
plt.show()

#2. Success Rate of Attacks Over Time
successful_attacks = Cleaned_Global_Terrorism_data.groupby('year')['successful_attack'].mean()
plt.figure(figsize=(12, 6))
sns.lineplot(x=successful_attacks.index, y=successful_attacks.values, marker='o', color='crimson')
plt.title("Success Rate of the Attacks Over the Years", fontsize=18, fontweight='bold')
plt.xlabel("Time", fontsize=14)
plt.ylabel("Success Rate", fontsize=14)
plt.xticks(rotation=45)

for x, y in zip(successful_attacks.index, successful_attacks.values):
    plt.text(x, y + 0.01, f'{y:.2f}', ha='center', va='bottom', fontsize=8)

plt.tight_layout()
plt.show()


#3 Which countries have suffered the most attacks?
Most_attacked_countries = Cleaned_Global_Terrorism_data['country'].value_counts().head(10)
plt.figure(figsize=(12, 6))
palette = sns.color_palette("rocket", len(Most_attacked_countries))
sns.barplot(x=Most_attacked_countries.index, y=Most_attacked_countries.values, palette=palette)
plt.title('Top 10 Countries with the Most Terrorist Attacks', fontsize=18, fontweight='bold')
plt.xlabel('Country', fontsize=14)
plt.ylabel('Number of Attacks', fontsize=14)
plt.xticks(rotation=10)

for index, value in enumerate(Most_attacked_countries.values):
    plt.text(index, value + 10, str(value), ha='center', va='bottom', fontsize=12)


plt.tight_layout()
plt.show()

#4. Which countries have suffered the most victims?
Victims_per_country = Cleaned_Global_Terrorism_data.groupby('country')['Total_victims'].sum().sort_values(ascending=False).head(10)
plt.figure(figsize=(12, 6))
palette = sns.color_palette("rocket", len(Victims_per_country))
sns.barplot(x=Victims_per_country.index, y=Victims_per_country.values, palette=palette)
plt.title('Top 10 Countries with the Most Victims (killed+wounded)', fontsize=18, fontweight='bold')
plt.xlabel('Country', fontsize=14)
plt.ylabel('Number of Victims', fontsize=14)
plt.xticks(rotation=10)

for index, value in enumerate(Victims_per_country.values):
    plt.text(index, value + 10, str(int(value)), ha='center', va='bottom', fontsize=12)

plt.tight_layout()
plt.show()

# World Map of Terrorist Attacks
victims_per_country = Cleaned_Global_Terrorism_data.groupby('country')['Total_victims'].sum().reset_index()
fig = px.choropleth(victims_per_country,
                    locations="country",
                    locationmode="country names",
                    color="Total_victims",
                    color_continuous_scale="Reds",
                    title="Total Number of Victims by Country")

fig.show()

#5. Who/What is the most common target of the attacks?
Common_target = Cleaned_Global_Terrorism_data[Cleaned_Global_Terrorism_data['target_type_1_txt'] != 'Unknown']
Most_common_target = Common_target['target_type_1_txt'].value_counts().head(10)
plt.figure(figsize=(12, 6))
palette = sns.color_palette("rocket", len(Most_common_target))
sns.barplot(x=Most_common_target.values, y=Most_common_target.index, palette=palette)
plt.title('Most Common Target Groups', fontsize=18, fontweight='bold')
plt.xlabel('Number of Attacks', fontsize=14)
plt.ylabel('Groups', fontsize=14)

for index, value in enumerate(Most_common_target.values):
    plt.text(value + 50, index, str(value), va='center', fontsize=12)

plt.tight_layout()
plt.show()

#6. Which terrorist groups have been the most active?
Terrorist_groups = Cleaned_Global_Terrorism_data[Cleaned_Global_Terrorism_data['terrorist_group'] !='Unknown']
Most_active_terrorist_groups = Terrorist_groups['terrorist_group'].value_counts().head(10)
plt.figure(figsize=(12, 6))
palette = sns.color_palette("rocket", len(Most_active_terrorist_groups))
sns.barplot(x=Most_active_terrorist_groups.values, y=Most_active_terrorist_groups.index, palette=palette)
plt.title('Top 10 Most Active Terrorists Groups', fontsize=18, fontweight='bold')
plt.xlabel('Number of Attacks', fontsize=14)
plt.ylabel('Group', fontsize=14)

for index, value in enumerate(Most_active_terrorist_groups.values):
    plt.text(value + 50, index, str(value), va='center', fontsize=12)

plt.tight_layout()
plt.show()

#7. What are the most common types of attacks?
# Distribution of attack types
attack_types = Cleaned_Global_Terrorism_data['attack_type_1_txt'].value_counts().head(5)
texts = attack_types.index
plt.figure(figsize=(8,8))
attack_types.plot.pie(autopct='%1.1f%%', startangle=90, colors=palette,  textprops=dict(color="#999999"))
plt.ylabel('')
plt.title('Distribution of Attack Types (Top 5)', fontsize=16)
plt.show()

#8. Which types of weapons are the deadliest?
Cleaned_Global_Terrorism_data['weapon_type_1_txt'] = Cleaned_Global_Terrorism_data['weapon_type_1_txt'].replace('Vehicle (not to include vehicle-borne explosives, i.e., car or truck bombs)', 'Vehicle (no explosives)')
Lethal_weapons = Cleaned_Global_Terrorism_data[Cleaned_Global_Terrorism_data['weapon_type_1_txt']!= 'Unknown']

plt.figure(figsize=(12,6))
sns.violinplot(data=Lethal_weapons,
               x='weapon_type_1_txt', 
               y='n_killed',
               palette='rocket')
plt.xticks(rotation=45, ha='right')
plt.title('Distribution of Deaths by Weapon Type', fontsize=16)
plt.xlabel('Weapon Type')
plt.ylabel('Number of Deaths')
plt.ylim(0, 50)
plt.tight_layout(pad=2.0)  # Aumenta el espacio entre elementos)
plt.show()

#Correlation Matrix of the most relevant features
correlation_data = Cleaned_Global_Terrorism_data[['year', 'extended_attack', 'multiple_attacks', 'successful_attack',
    'suicide_attack', 'individual_attack', 'n_killed', 'n_wounded', 'n_killed_terrorists', 'n_wounded_terrorists', 'hostage_or_kidnapping']]
correlation_matrix = correlation_data.corr()
plt.figure(figsize=(12, 10))
sns.heatmap(correlation_matrix, annot=True, cmap='coolwarm', linewidths=0.5)
plt.title("Correlation Matrix Between Relevant Variables", fontsize=16)
plt.tight_layout()
plt.show()
