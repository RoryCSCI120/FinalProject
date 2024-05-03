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

https://coronavirus-resources.esri.com/datasets/esri::county-28/explore?location=37.172537%2C-119.918825%2C4.00 - ACS Median Household Income per census tract
ESRI Living Atlas - ACS Specific Languages and population per census tract

[MA Cities](https://www.mass.gov/info-details/massgis-data-2020-us-census-towns) - Massachusetts Towns

Figure 1 - Census Tracts within Worcester city boundary, with background of Winter surface temperature
![image](https://github.com/RoryCSCI120/FinalProject/assets/131007848/8364a268-b970-49a7-87be-fd9c4dbbd7dc)

https://gisdata.worcesterma.gov/datasets/47dc76d64f18496b9dd1e3b11968af7f_1/explore - Lakes, Ponds, Rivers for the city of Worcester

https://gisdata.worcesterma.gov/search?groupIds=8ba79ce2db2749dfac73159337878bad - Open Spaces for the city of Worcester (Green Spaces)

https://gisdata.worcesterma.gov/datasets/4aaa3476e6114050b2d210b6e03baef3_2/explore?location=42.275466%2C-71.808469%2C12.10 - Buildings in Worcester

Figure 2 - Bodies of Water, open spaces and buildings within the city boundaries of Worcester, with background of Winter surface temperature
![image](https://github.com/RoryCSCI120/FinalProject/assets/131007848/bb8c5a3a-18bb-4da0-9940-c247787f8149)

https://gisdata.worcesterma.gov/datasets/48173f9ea9344b628f61a6a8cfc670c1_2/explore?location=42.265276%2C-71.788987%2C13.00 - Historic Redlining Data for the city of Worcester

Figure 3 - Worcester Historic Redlining Districts with background of January 2023 surface temperature
![image](https://github.com/RoryCSCI120/FinalProject/assets/131007848/ff865cb8-a1a7-44c4-8534-e0ef1c97322b)

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
To load in the data to a database, the following sql scripts must be run in postgres: low_english.sql, median_income.sql, ndvi_january_worcester.sql, ndvi_july_worcester.sql, temp_january_worcester.sql, temp_july_worcester.sql, buildings_sql, water_sql and redlining_zones.sql. These files are contained within the sql folder. Example scripts below:

"C:\Program Files\PostgreSQL\16\bin\raster2pgsql.exe" -s 4326 -I -C -M C:\Users\User\Desktop\Final_Project\NDVI_January_4326.vrt public.NDVI_January > NDVI_January.sql

"C:\Program Files\PostgreSQL\16\bin\shp2pgsql.exe" -s 4326 -I C:\Users\User\Desktop\Final_Project\Open_Spaces\Open_Spaces.shp public.parks > parks.sql

For the actual spatial querying, I utilized the the ST_Intersects function to determine the average temperatures and NDVI values in each census tract. Full Scripts can be found in the analysis section of the repository. Example below:
![image](https://github.com/RoryCSCI120/FinalProject/assets/131007848/f9431e5c-ef8f-4aa0-bf42-2d6421d74a19)


#### Results
Unfortunately, this was a fairly limited study with not all layers being used in the end. The primary achievment was the the analysis relating to correlation between the non-English speaking population of Worcester, heat, NDVI and historic redlining. THe main takeaways from the analysis is that there is much weaker correlation between non-English speaking populations, historic redlining and urban heat and NDVI, though the latter two comparisions should be taken with a very large grain of salt. For Historic Redliing Districts, while the areas formerly zoned as red have some of the highest percentages of non_english speakers (22.12% and 15%), theses are not the highest average percentages. The highest average percentage (23.64%) can be found in the downtown area of Worcester, which was classified as "Business" rather than being evaluated as a color like the other zones. The highest average percetage in one of the color assigned zones belongs to a Zone 7 (22.2%), which was deemed blue, or "Still Desirable." On the other end of the spectrum, the lowest average percentage (9.65%) is found in a yellow (Definetly Declining) zone. The only green (Best) zone comes in the middle of the bunch with a non-English speaking population of 13.
Figure 4: Side by side of average percentage of people with low English ability in Historic Redling Zones and Historic Redlining Zones with apropriate colors.
![image](https://github.com/RoryCSCI120/FinalProject/assets/131007848/3ff95fc4-1f5c-4bba-ae0c-a5e1098c70d6)

The temperature also appears to have a very weak correlation. Though many of the highest percentages of non-English speakers appear in the center of Worcester alongside some of the highest temepratures, I would presumer this is likily more to do with the density of buildings. This could be justified by the fact that in the NDVI maps the reverse is seen with NDVI beign strongest as density of buildings presumably goes down.
Figure 5: Side by side of average temperature in mid January, 2024 in Worcester census tracts and percentage of people with low English ability per census tract in Worcester.
![image](https://github.com/RoryCSCI120/FinalProject/assets/131007848/4455c97e-502a-475e-ae73-8fc551434782)

Figure 6: Side by side of average temperature in mid July, 2024 in Worcester census tracts and percentage of people with low English ability per census tract in Worcester.
![image](https://github.com/RoryCSCI120/FinalProject/assets/131007848/2664bbc7-4110-4ebe-a03a-db40b5949e43)

Figure 7: Side by side of average NDVI in mid January, 2024 in Worcester census tracts and percentage of people with low English ability per census tract in Worcester.
![image](https://github.com/RoryCSCI120/FinalProject/assets/131007848/2a3f1aae-e5ec-4832-94a0-aae166fc22be)

Figure 8: Side by side of average NDVI in mid July, 2024 in Worcester census tracts and percentage of people with low English ability per census tract in Worcester.
![image](https://github.com/RoryCSCI120/FinalProject/assets/131007848/ab35bad0-b359-45e7-a50d-777670f7afc5)











