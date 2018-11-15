library(rgdal)
library(raster)


itareg=readOGR(".","Reg01012018_WGS84")

proj4string(itareg)
ex_ita=extent(itareg)

# ystem("gdalwarp -r near -overwrite MODIS_250_images.tif out_ras.tif  -t_srs EPSG:32632")

ras_evi=raster("out_ras.tif")

raster_ita_250m=crop(ras_evi,ex_ita)
raster_ita_250m=raster_ita_250m*0+1
writeRaster(raster_ita_250m,"raster_ita_250m.tif")
raster_ita_250m_masked=mask(raster_ita_250m, itareg)
writeRaster(raster_ita_250m_masked,"raster_ita_250m_masked.tif")

