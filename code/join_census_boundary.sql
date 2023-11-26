UPDATE cleaned_census
SET NAME = REPLACE(NAME, ', Cook County, Illinois', '')
WHERE NAME LIKE '%, Cook County, Illinois';

ALTER TABLE cleaned_census
ADD COLUMN average_vehicles FLOAT;

DELETE FROM cleaned_census
WHERE medianincome = '-' AND houseunits = '0';

UPDATE cleaned_census
SET medianincome = '0'
WHERE medianincome = '-';

DELETE FROM cleaned_census
where id = 1;

UPDATE cleaned_census
SET medianincome = '250000'
WHERE medianincome = '250,000+';

ALTER TABLE cleaned_census
ALTER COLUMN novehicle TYPE INT USING novehicle::INT,
ALTER COLUMN onevehicle TYPE INT USING onevehicle::INT,
ALTER COLUMN twovehicle TYPE INT USING twovehicle::INT,
ALTER COLUMN threevehicle TYPE INT USING threevehicle::INT,
ALTER COLUMN medianincome TYPE INT USING medianincome::INT,
ALTER COLUMN houseunits TYPE INT USING houseunits::INT;

UPDATE cleaned_census
SET average_vehicles = (onevehicle + 2 * twovehicle + 3 * threevehicle) * 1.0 / houseunits;

CREATE VIEW "boundaries_census_data" AS
SELECT 
	boundaries_census.*,
	cleaned_census.name,
	cleaned_census.novehicle,
	cleaned_census.onevehicle,
	cleaned_census.twovehicle,
	cleaned_census.threevehicle,
	cleaned_census.medianincome,
	cleaned_census.houseunits,
	cleaned_census.average_vehicles
FROM boundaries_census
JOIN cleaned_census on boundaries_census.namelsad10 = cleaned_census.NAME;