--Data and Columns Preview--
SELECT TOP 10* FROM Global_Terrorism_Dataset

--Number of records in the dataset--
SELECT COUNT(*) AS database_records FROM Global_Terrorism_Dataset

--Rename the columns for clarity--
EXEC sp_rename 'Global_Terrorism_Dataset.eventid', 'event_id', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.iyear', 'year', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.imonth', 'month', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.iday', 'day', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.approxdate', 'approx_date', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.extended', 'extended_attack', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.resolution', 'resolution', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.country', 'country_code', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.country_txt', 'country', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.region', 'region_code', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.region_txt', 'region', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.provstate', 'province', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.city', 'city', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.latitude', 'latitude', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.longitude', 'longitude', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.specificity', 'specificity', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.vicinity', 'vicinity', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.location', 'location_description', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.summary', 'summary', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.crit1', 'criterion_1', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.crit2', 'criterion_2', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.crit3', 'criterion_3', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.doubtterr', 'doubt_terrorism', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.alternative', 'alternative_attack_type', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.alternative_txt', 'alternative_attack_type_txt', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.multiple', 'multiple_attacks', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.success', 'successful_attack', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.suicide', 'suicide_attack', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.attacktype1', 'attack_type_1', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.attacktype1_txt', 'attack_type_1_txt', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.attacktype2', 'attack_type_2', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.attacktype2_txt', 'attack_type_2_txt', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.attacktype3', 'attack_type_3', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.attacktype3_txt', 'attack_type_3_txt', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.targtype1', 'target_type_1', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.targtype1_txt', 'target_type_1_txt', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.targsubtype1', 'target_subtype_1', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.targsubtype1_txt', 'target_subtype_1_txt', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.corp1', 'target_entity_1', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.target1', 'target_1', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.natlty1', 'nationality_1', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.natlty1_txt', 'nationality_1_txt', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.gname', 'terrorist_group', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.gsubname', 'sub_group', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.guncertain1', 'group_uncertainty_1', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.individual', 'individual_attack', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.nperps', 'number_of_perpetrators', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.nperpcap', 'perpetrators_captured', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.claimed', 'claimed_responsibility', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.claimmode', 'claim_mode', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.claimmode_txt', 'claim_mode_txt', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.compclaim', 'competing_claims', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.weaptype1', 'weapon_type_1', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.weaptype1_txt', 'weapon_type_1_txt', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.weapsubtype1', 'weapon_subtype_1', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.weapsubtype1_txt', 'weapon_subtype_1_txt', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.nkill', 'n_killed', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.nkillus', 'n_killed_us', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.nkillter', 'n_killed_terrorists', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.nwound', 'n_wounded', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.nwoundus', 'n_wounded_us', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.nwoundte', 'n_wounded_terrorists', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.property', 'property_damage', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.propextent', 'property_extent', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.propextent_txt', 'property_extent_txt', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.propvalue', 'property_value', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.propcomment', 'property_comment', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.ishostkid', 'hostage_or_kidnapping', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.nhostkid', 'n_hostages', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.nhostkidus', 'n_hostages_us', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.nhours', 'hostage_hours', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.ndays', 'hostage_days', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.divert', 'diverted', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.kidhijcountry', 'kidnapping_country', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.ransom', 'ransom_demanded', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.ransomamt', 'ransom_amount', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.ransomamtus', 'ransom_amount_us', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.ransompaid', 'ransom_paid', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.ransompaidus', 'ransom_paid_us', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.ransomnote', 'ransom_note', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.hostkidoutcome', 'hostage_outcome', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.hostkidoutcome_txt', 'hostage_outcome_txt', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.nreleased', 'n_released', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.addnotes', 'additional_notes', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.scite1', 'source_1', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.scite2', 'source_2', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.scite3', 'source_3', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.dbsource', 'database_source', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.INT_LOG', 'international_logistics', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.INT_IDEO', 'international_ideology', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.INT_MISC', 'international_misc', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.INT_ANY', 'international_any', 'COLUMN';
EXEC sp_rename 'Global_Terrorism_Dataset.related', 'related_attacks', 'COLUMN';

--Check if the implementation of the changes was correct--
EXEC sp_help 'Global_Terrorism_Dataset';


--Data type of each column--
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='Global_Terrorism_Dataset'

--Change some data types for better comprehension (float to bigint)--
ALTER TABLE Global_Terrorism_Dataset
ALTER COLUMN specificity BIGINT
ALTER TABLE Global_Terrorism_Dataset
ALTER COLUMN doubt_terrorism BIGINT
ALTER TABLE Global_Terrorism_Dataset
ALTER COLUMN alternative_attack_type BIGINT
ALTER TABLE Global_Terrorism_Dataset
ALTER COLUMN multiple_attacks BIGINT
ALTER TABLE Global_Terrorism_Dataset
ALTER COLUMN attack_type_2 BIGINT
--....more changes in the data types....--

--Let's see the amount of null values of some of the columns--
SELECT
    COUNT(*) AS total_records,
    SUM(CASE WHEN year IS NULL THEN 1 ELSE 0 END) AS null_year,
    SUM(CASE WHEN month IS NULL THEN 1 ELSE 0 END) AS null_month,
    SUM(CASE WHEN day IS NULL THEN 1 ELSE 0 END) AS null_day,
    SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS null_country,
    SUM(CASE WHEN region IS NULL THEN 1 ELSE 0 END) AS null_region,
    SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS null_city,
    SUM(CASE WHEN attack_type_1_txt IS NULL THEN 1 ELSE 0 END) AS null_attack_type,
    SUM(CASE WHEN target_type_1_txt IS NULL THEN 1 ELSE 0 END) AS null_target_type,
    SUM(CASE WHEN terrorist_group IS NULL THEN 1 ELSE 0 END) AS null_terrorist_group,
    SUM(CASE WHEN n_killed IS NULL THEN 1 ELSE 0 END) AS null_n_killed,
    SUM(CASE WHEN n_wounded IS NULL THEN 1 ELSE 0 END) AS null_n_wounded,
    SUM(CASE WHEN weapon_type_1_txt IS NULL THEN 1 ELSE 0 END) AS null_weapon_type,
    SUM(CASE WHEN claimed_responsibility IS NULL THEN 1 ELSE 0 END) AS null_claimed_responsibility,
    SUM(CASE WHEN suicide_attack IS NULL THEN 1 ELSE 0 END) AS null_suicide_attack,
    SUM(CASE WHEN successful_attack IS NULL THEN 1 ELSE 0 END) AS null_successful_attack
FROM Global_Terrorism_Dataset;

--Let's see the amount of unique values for some of the most important columns--
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT year) AS unique_years,
    COUNT(DISTINCT month) AS unique_months,
    COUNT(DISTINCT day) AS unique_days,
    COUNT(DISTINCT country) AS unique_countries,
    COUNT(DISTINCT region) AS unique_regions,
    COUNT(DISTINCT city) AS unique_cities,
    COUNT(DISTINCT attack_type_1_txt) AS unique_attack_types,
    COUNT(DISTINCT target_type_1_txt) AS unique_target_types,
    COUNT(DISTINCT terrorist_group) AS unique_terrorist_groups,
    COUNT(DISTINCT n_killed) AS unique_n_killed_values,
    COUNT(DISTINCT n_wounded) AS unique_n_wounded_values,
    COUNT(DISTINCT weapon_type_1_txt) AS unique_weapon_types,
    COUNT(DISTINCT claimed_responsibility) AS unique_claimed_responsibility,
    COUNT(DISTINCT suicide_attack) AS unique_suicide_attack,
    COUNT(DISTINCT successful_attack) AS unique_successful_attack
FROM Global_Terrorism_Dataset;







