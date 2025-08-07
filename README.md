# Landsat_Terra_R_K-Means
### NOTICE: The following work is the original creation of Marko Tyhansky and is not permitted for use without consent of original author.
#### An R project focusing on using the Terra package to analyze a Landsat image of the Massachusetts bay area and using K-means clustering to classify the area.
This project was a side project of mine over the summer where I employed machine learning concepts (k-means clustering) to analize a topographical image of the Mass. bay area using the Terra R Package. Here are some concepts I learned or practiced in this project:
Note: Results were converted from .tif files

## 1. Spatial Data Handling
Loaded and manipulated a multi-band geospatial raster file using the terra package. Required an understanding of raster structure, coordinate systems, band information, and resolution.

## 2. Unsupervised Machine Learning
Applied k-means clustering to perform unsupervised land cover classification on raster data. Managed missing data, extracted values from raster layers, and grouped pixels based on spectral similarity.

## 3. Data Visualization
Produced RGB and classified raster plots with custom color palettes using plotRGB() and plot(). Enhanced visualization using legends, axis labels, and color schemes (RColorBrewer).
