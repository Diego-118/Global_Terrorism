--FIRST QUERIES TO UNDERSTAND BETTER THE DATASET--

--1. How has the number of attacks evolved over time?--
SELECT year, COUNT(*) AS total_attacks
FROM Global_Terrorism_Dataset
GROUP BY year
ORDER BY year

--2. Which years had the most deaths from attacks?--
SELECT year, SUM(n_killed) AS total_kills
FROM Global_Terrorism_Dataset
GROUP BY year
ORDER BY total_kills DESC

--3. Which countries have experienced the most attacks?--
SELECT TOP 20 country, COUNT(*) AS total_attacks
FROM Global_Terrorism_Dataset
GROUP BY country
ORDER BY total_attacks DESC

--4. Which regions have been most affected?--
SELECT TOP 20 region, COUNT(*) AS total_attacks
FROM Global_Terrorism_Dataset
GROUP BY region
ORDER BY total_attacks DESC

--5. Which countries have had the most fatalities?--
SELECT TOP 20 country, COUNT(n_killed) AS total_kills
FROM Global_Terrorism_Dataset
GROUP BY country
ORDER BY total_kills DESC

--6. What are the most common types of attacks?--
SELECT attack_type_1_txt, COUNT(*) AS most_common_attack
FROM Global_Terrorism_Dataset
GROUP BY attack_type_1_txt
ORDER BY most_common_attack DESC

--7. What are the most lethal types of attacks?--
SELECT attack_type_1_txt, SUM(n_killed) AS Killed_by_attack
FROM Global_Terrorism_Dataset
GROUP BY attack_type_1_txt
ORDER BY Killed_by_attack DESC

--8. What types of weapons are most used?--
SELECT weapon_type_1_txt, COUNT(*) AS most_common_weapons
FROM Global_Terrorism_Dataset
GROUP BY weapon_type_1_txt
ORDER BY most_common_weapons DESC

--9. Which are the most active groups (excluding 'Unknown')?--
SELECT TOP 20 terrorist_group, COUNT(*) AS most_active_terrorist_groups
FROM Global_Terrorism_Dataset
WHERE terrorist_group!= 'Unknown'
GROUP BY terrorist_group
ORDER BY most_active_terrorist_groups DESC

--10. Which groups have caused the most deaths?--
SELECT TOP 20 terrorist_group, SUM(n_killed) AS total_kills_by_terrorist_group
FROM Global_Terrorism_Dataset
WHERE terrorist_group!='Unknown'
GROUP BY terrorist_group
ORDER BY total_kills_by_terrorist_group DESC

--11. How many attacks have been suicidal and where do they occur the most?--
SELECT country, COUNT(*) AS suicide_attacks
FROM Global_Terrorism_Dataset
WHERE suicide_attack=1
GROUP BY country
ORDER BY suicide_attacks DESC

--12. Which attacks involved hostage-taking?--
SELECT country, COUNT(*) AS number_of_attacks_with_hostages
FROM Global_Terrorism_Dataset
WHERE hostage_or_kidnapping=1
GROUP BY country
ORDER BY number_of_attacks_with_hostages DESC