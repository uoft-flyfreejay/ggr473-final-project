UPDATE cleaned_census
SET NAME = REPLACE(NAME, ', Cook County, Illinois', '')
WHERE NAME LIKE '%, Cook County, Illinois';

SELECT *
FROM boundaries_census
JOIN cleaned_census on boundaries_census.namelsad10 = cleaned_census.NAME;