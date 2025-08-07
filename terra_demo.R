# Load required libraries
library(terra)
library(RColorBrewer)

# Load the raster file
image <- rast("boston_bay_Landsat1-5.tif")

# Print basic info
print(image)
nlyr(image)  # number of bands
names(image) <- paste0("Band_", 1:nlyr(image))  # rename for clarity

# Plot as RGB and adjust bands as necessary
plotRGB(image, r = 3, g = 2, b = 1, stretch="lin", axes = TRUE,
        main = "Balkan Flooding - RGB Composite")

# Convert raster values to matrix for clustering
vals <- values(image)
vals <- na.omit(vals)  # remove missing data

# Apply k-means clustering (e.g., 5 classes)
set.seed(42)
k <- 5
kmeans_result <- kmeans(vals, centers = k, iter.max = 100)

# Create a classification raster
classified <- image[[1]]
values(classified) <- NA
values(classified)[!is.na(values(image[[1]]))] <- kmeans_result$cluster

# Plot classified raster
palette <- brewer.pal(k, "Set1")
plot(classified, col = palette, main = "Unsupervised Classification (K-Means)")

# Save classified raster
writeRaster(classified, "classified_balkan_flooding.tif", overwrite=TRUE)

# Suppose cluster 2 represents Land
levels(classified) <- data.frame(id = 1:5,
                                 class = c("Water", "Land", "Heavy Clouds", "Light Clouds", "N/A"))
plot(classified, col = palette, main = "Classified Map with Labels", axes = TRUE, legend = TRUE)

freq_table <- freq(classified)
pixel_area <- res(classified)[1] * res(classified)[2]  # in square map units (e.g., meters)
area_per_class <- data.frame(
  class = freq_table$value,
  pixel_count = freq_table$count,
  area_sqm = freq_table$count * pixel_area
)
print(area_per_class)
writeRaster(classified, "boston_bay_final.tif", overwrite = TRUE)