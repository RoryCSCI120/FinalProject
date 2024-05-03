# FinalProject
## IDCE 376
Rory Dickinson

### Introduction
Urban Heat Islands are a growing issue in many cities across the United States. In most studies, factors such as income and race have been used to examine inequalities in exposure to such harmful envrionemntal factors like heat. Many studies also often pair these sorts of factors with historical data related to the practice of redlining, where certain neighborhoods were deemed poor for investment. Neighborhoods which were once redlined tend to also be the neighborhoods today with the highest temperatures. 
The main objectives of this project are to: determine whether there is a correlation between concentrations of populations with low English ability and the factors which contribute to the urban heat island effect.

### Data

This study utilizes a combination of vector and raster data for the city of Worcester, Massachusetts.

#### Sources:
Vector Layers:

[Demographics](https://coronavirus-resources.esri.com/datasets/esri::county-28/explore?location=33.307776%2C-119.918825%2C4.00) - - Median Household Income Census Tract Data polygons census tracts

ESRI Living Atlas - ACS Specific Languages and population per census tract

[MA Cities](https://www.mass.gov/info-details/massgis-data-2020-us-census-towns) - Massachusetts Towns

Figure 1 - Census Tracts within Worcester city boundary, with background of Winter surface temperature
![tracts](https://github.com/RoryCSCI120/FinalProject/assets/131007848/bb5a5fa1-55ce-453b-a775-c2f9a4e5d56e)

https://gisdata.worcesterma.gov/datasets/47dc76d64f18496b9dd1e3b11968af7f_1/explore - Lakes, Ponds, Rivers for the city of Worcester

https://gisdata.worcesterma.gov/search?groupIds=8ba79ce2db2749dfac73159337878bad - Open Spaces for the city of Worcester (Green Spaces)

https://gisdata.worcesterma.gov/datasets/4aaa3476e6114050b2d210b6e03baef3_2/explore?location=42.275466%2C-71.808469%2C12.10 - Buildings in Worcester

Figure 2 - Bodies of Water, open spaces and buildings within the city boundaries of Worcester, with background of Winter surface temperature
![layers](https://github.com/RoryCSCI120/FinalProject/assets/131007848/e31d158e-7fc0-476e-9ed8-84a9ee6a5303)

https://gisdata.worcesterma.gov/datasets/48173f9ea9344b628f61a6a8cfc670c1_2/explore?location=42.265276%2C-71.788987%2C13.00 - Historic Redlining Data for the city of Worcester

Figure 3 - Worcester Historic Redlining Districts with background of January 2023 surface temperature
![red](https://github.com/RoryCSCI120/FinalProject/assets/131007848/2135ac69-2821-4bde-bef0-a69622f71f91)

Raster Layers:

https://search.earthdata.nasa.gov/search?portal=obdaac - Land Surface Temperature

https://browser.dataspace.copernicus.eu/ - NDVI: NDVI was calculate by taking the 8th and 4th bands of Sentinel 2 images and running them through the NDVI formula using the raster calculator. All pixels valued over 0 are considered vegetation.

![image](https://github.com/RoryCSCI120/FinalProject/assets/131007848/77b24332-5612-4359-9321-0ddc42988a77)

#### Data Preprocessing: 
All data layers were brough into QGIS and reprojected to EPSG: 4326 - WGS 84. When brought into QGIS, the demographic data layers portraying language communites and English ability by census block, and median houshold income lost their English column titles. Consultation of the source data on ESRI's website had to be done to make sure the correct columns were known. After this, attribute table of these two ayers were cut down to only the necessary columns. 
These being:![image](https://github.com/RoryCSCI120/FinalProject/assets/131007848/bbd53c49-e1f8-4a37-ad6e-524fcc1f8bac)

For the languages data by census blocks, the necessary columns kept are as follows: ![image](https://github.com/RoryCSCI120/FinalProject/assets/131007848/819c7991-b781-487d-b8f2-56a6ed241e6d)

The geom column was also kept. The columns with strings of characters as names are, population of census block, population with low English ability, and percent of said population with low English ability. 

The raster layers when brought into QGIS, were clipped by a mask layer. The mask used was the Worcester city boundary polygon. This was done to contain the study area further and make the rather large layers more manageable.

Data Normalization

All of the other shapefiles did not require normalization, though some columns were still removed with the ALTER TABLE command. The buildings shapefile did require normalization, though this was solved with the ALTER TABLE. The buildings shapefile can be ommitted from the analysis id necessary though as it is not integral to the main objective.

The raster data is already normalized as the only contain two columns with not multiple variables.

#### Methods
To load in the data to a database, the following sql scripts must be run in postgres: low_english.sql, median_income.sql, ndvi_january_worcester.sql, ndvi_july_worcester.sql, temp_january_worcester.sql, temp_july_worcester.sql, buildings_sql, water_sql and redlining_zones.sql. These files are contained within the sql folder.






