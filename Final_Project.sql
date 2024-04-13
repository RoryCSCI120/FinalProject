--Demographics - Median Income Data
CREATE TABLE demographics_median_income (
INCOMEID SERIAL PRIMARY KEY --Create a primary key
NAME VARCHAR(255) -- Census Tract
STATE VARCHAR(255)
COUNTY VARCHAR(255)
MEDIAN_INCOME NUMERIC -- Median Household Income Value
GEOM GEOMETRY(polygon, 4326) -- WGS 84
);

--Demographics - Language Data
CREATE TABLE demographics_language (
LANGUAGEID SERIAL PRIMARY KEY --Create a primary key
NAME VARCHAR(255) -- Census Tract
STATE VARCHAR(255)
COUNTY VARCHAR(255)
LANGUAGE_COUNT NUMERIC -- number of people with low english ability
LANGUAGE_PERCENT NUMERIC -- percent of people with low english ability
GEOM GEOMETRY(polygon, 4326) -- WGS 84
);

--Buildings Data
CREATE TABLE buildings (
BUILDINGID SERIAL PRIMARY KEY
TYPE VARCHAR(225)
STREET_ID SERIAL)
STREET_TEX VARCHAR (225)
GEOM GEOMETRY(polygon, 4326) -- WGS 84
);

--Redlining Data
CREATE TABLE redlining (
REDLININGID SERIAL PRIMARY KEY
ZONENUMBER VARCHAR (255) -- numbers assigned to redlining zones
ZONECATEGORY VARCHAR (255) -- colors assigned to redlining zones
GEOM GEOMETRY(polygon, 4326) -- WGS 84
);

--Water Data
CREATE TABLE water (
WATERID SERIAL PRIMARY KEY
TYPE VARCHAR (255)
NAME VARCHAR (255)
GEOM GEOMETRY(polygon, 4326) -- WGS 84
);

--Open Spaces Data
CREATE TABLE open_spaces (
OPENSPACESID SERIAL PRIMARY KEY --Create a primary key
STREET VARCHAR (255) --location
SIZE VARCHAR (255)
);
