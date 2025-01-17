CREATE EXTENSION postgis
CREATE EXTENSION postgis_raster

SELECT * FROM nonenglish_speakers;

SELECT * FROM temp_january;

SELECT * FROM ndvi_january;

SELECT * FROM water;

SELECT * FROM spatial_ref_sys;

SELECT * FROM redlining_zones;

SELECT * FROM ndvi_july;

ALTER TABLE redlining_zones
DROP COLUMN zonecat;

SELECT * FROM temp_july;

SELECT * FROM buildings;

SELECT * FROM median_household_income;
--so I can see all of my initial tables first	
	
-- Calculating the average temperature and NDVI in July in each census tract in Worcester
SELECT nonenglish_speakers.c16001_c_4 AS nonenglish_speaker_percentage,
AVG(ST_Value(temp_july.rast, 1, ST_Centroid(nonenglish_speakers.geom))) - 273.15 AS average_july_temperatures, -- averages the temperature values within the census tracts and converts the temperature values from Kelvin to Celcius
AVG(ST_Value(ndvi_july.rast, 1, ST_Centroid(nonenglish_speakers.geom))) AS average_july_ndvi, -- averages the NDVI values within the census tracts
ST_AsText(nonenglish_speakers.geom) AS geometry -- assigns the gemetry, the shape part of the shapefile
FROM nonenglish_speakers 
JOIN temp_july 
ON ST_Intersects(nonenglish_speakers.geom, temp_july.rast)
JOIN ndvi_july 
ON ST_Intersects(nonenglish_speakers.geom, ndvi_july.rast) -- above joins the datasets together to create the final output
GROUP BY nonenglish_speakers.c16001_c_4, nonenglish_speakers.geom; -- determines which geometry to use and which category to go by

--Calculating the average temperature and NDVI in January in each Worcester Census Tract
SELECT nonenglish_speakers.c16001_c_4 AS nonenglish_speaker_percentage,
AVG(ST_Value(temp_january.rast, 1, ST_Centroid(nonenglish_speakers.geom))) - 273.15 AS average_january_temperatures, -- averages the temperature values within the census tracts and converts the temperature values from Kelvin to Celcius
AVG(ST_Value(ndvi_january.rast, 1, ST_Centroid(nonenglish_speakers.geom))) AS average_january_ndvi,
ST_AsText(nonenglish_speakers.geom) AS geometry
FROM nonenglish_speakers
JOIN temp_january 
ON ST_Intersects(nonenglish_speakers.geom, temp_january.rast)
JOIN ndvi_january 
ON ST_Intersects(nonenglish_speakers.geom, ndvi_january.rast)
GROUP BY nonenglish_speakers.c16001_c_4, nonenglish_speakers.geom;

--Calculating the average percentage non-English Speaking Population in each Historic Redlining Zone
WITH average_nonenglish_zones AS ( -- creates a common table expression
SELECT rz.zonenumber, -- selects which column in the redlining zones table to use as a foundation
AVG(nes.c16001_c_4) AS avg_percent_nonenglish -- calculates the average percentage of non-english peakers column from the initial nonenglish_speakers table
FROM redlining_zones rz 
LEFT JOIN nonenglish_speakers nes ON ST_Intersects(rz.geom, nes.geom) -- joins the new columns
GROUP BY rz.zonenumber -- tells how to groupd the new columns with the old one that was used as the foundation
)
SELECT -- selects the columns which will be in the final csv
rz.gid,
rz.zonenumber,
rz.zonecolor,
anz.avg_percent_nonenglish,
rz.geom
FROM redlining_zones rz
LEFT JOIN average_nonenglish_zones anz ON rz.zonenumber = anz.zonenumber;


 






