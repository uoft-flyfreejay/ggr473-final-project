UPDATE Excel_cleaned_census
SET NAME = REPLACE(NAME, ', Cook County, Illinois', '')
WHERE NAME LIKE '%, Cook County, Illinois';

ALTER TABLE Excel_cleaned_census
ADD COLUMN percent_households_with_car FLOAT;

DELETE FROM Excel_cleaned_census
WHERE medianincome = '-' ;

UPDATE Excel_cleaned_census
SET medianincome = '250000'
WHERE medianincome = '250,000+';

ALTER TABLE Excel_cleaned_census
ALTER COLUMN novehicle TYPE INT USING novehicle::INT,
ALTER COLUMN onevehicle TYPE INT USING onevehicle::INT,
ALTER COLUMN twovehicle TYPE INT USING twovehicle::INT,
ALTER COLUMN threevehicle TYPE INT USING threevehicle::INT,
ALTER COLUMN medianincome TYPE INT USING medianincome::INT;

UPDATE Excel_cleaned_census
SET percent_households_with_car = ((onevehicle + twovehicle + threevehicle) / (novehicle + onevehicle + twovehicle + threevehicle)) * 100;

CREATE VIEW "sql_cleaned_data" AS
SELECT 
	boundaries_census.*,
	Excel_cleaned_census.name,
	Excel_cleaned_census.novehicle,
	Excel_cleaned_census.onevehicle,
	Excel_cleaned_census.twovehicle,
	Excel_cleaned_census.threevehicle,
	Excel_cleaned_census.medianincome,
	Excel_cleaned_census.percent_households_with_car
FROM boundaries_census
JOIN Excel_cleaned_census on boundaries_census.namelsad10 = Excel_cleaned_census.NAME;