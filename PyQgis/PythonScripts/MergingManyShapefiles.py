from qgis.core import *
import os
 
# Set the directory where the input files are stored
directory = QgsProject.instance().readPath("./")+"/"
 
# Get the list of input files
fileList = os.listdir(directory)
 
# Copy the features from all the files in a new list
feats = []
for file in fileList:
    if file[-8:]=='adm2.shp':
        layer = QgsVectorLayer(directory + file, file, 'ogr')
        for feat in layer.getFeatures():
            geom = feat.geometry()
            attrs = feat.attributes()
            feature = QgsFeature()
            feature.setGeometry(geom)
            feature.setAttributes(attrs)
            feats.append(feature)
 
# Get the Coordinate Reference System and the list of fields from the last input file
crs = layer.crs().toWkt()
field_list = layer.dataProvider().fields().toList()
 
# Create the merged layer by checking the geometry type of  the input files (for other types, please see the API documentation)
if layer.wkbType()==QGis.WKBPoint:
    v_layer = QgsVectorLayer('Point?crs=' + crs, 'Merged', "memory")
if layer.wkbType()==QGis.WKBLineString:
    v_layer = QgsVectorLayer('LineString?crs=' + crs, 'Merged', "memory")
if layer.wkbType()==QGis.WKBPolygon:
    v_layer = QgsVectorLayer('Polygon?crs=' + crs, 'Merged', "memory")
 
# Add the features to the merged layer
prov = v_layer.dataProvider()
prov.addAttributes(field_list)
v_layer.updateFields()
v_layer.startEditing()
prov.addFeatures(feats)
v_layer.commitChanges()
 
QgsMapLayerRegistry.instance().addMapLayer(v_layer)
