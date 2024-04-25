# FinalProject
## IDCE 376
Rory Dickinson

### Introduction
Urban Heat Islands are a growing issue in many cities across the United States. In most studies, factors such as income and race have been used to examine inequalities in exposure to such harmful envrionemntal factors like heat. Many studies also often pair these sorts of factors with historical data related to the practice of redlining, where certain neighborhoods were deemed poor for investment. Neighborhoods which were once redlined tend to also be the neighborhoods today with the highest temperatures. 
The main objectives of this project are to: determine whether there is a correlation between concentrations of poulations with low English ability and the factors which contribute to the urban heat island effect.

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

Figure 3: Winter Surface Temperatures with Worcester Boundary
![winter_temp](https://github.com/RoryCSCI120/FinalProject/assets/131007848/0cb4a709-96aa-4aee-b988-8ed734d3161d)

Figure 4: Summer Surface Temperatures with Worcester Boundary
![July_temp](https://github.com/RoryCSCI120/FinalProject/assets/131007848/031bad30-7627-4df7-a07b-2538f5155e5d)

https://browser.dataspace.copernicus.eu/ - NDVI: NDVI was calculate by taking the 8th and 4th bands of Sentinel 2 images and running them through the NDVI formula using the raster calculator. All pixels valued over 0 are considered vegetation.

Figure 5: Winter NDVI with Worcester Boundary with Worcester Boundary
![ndvi_january](https://github.com/RoryCSCI120/FinalProject/assets/131007848/d4833a93-a040-4ed0-a1d9-d6af96c93c2e)


Figure 6: Summer NDVI with Worcester Boundary with Worcester Boundary
![ndvi_july](https://github.com/RoryCSCI120/FinalProject/assets/131007848/3fd7cff2-f67b-4c6a-b2ab-61c4d2d78d24)

#### Data Preprocessing: 
All data layers were brough into QGIS and reprojected to EPSG: 4326 - WGS 84. When brought into QGIS, the demographic data layers portraying language communites and English ability by census block, and median houshold income lost their English column titles. Consultation of the source data on ESRI's website had to be done to make sure the correct comuns were known. 




