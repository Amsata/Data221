from qgis.core import *
import os
 
# Set the directory where the input files are stored
directory = QgsProject.instance().readPath("./")+"/folder/"
 
# Get the list of input files
fileList = os.listdir(directory)
 
# Copy the features from all the files in a new list
feats = []
for file in fileList:
    if file[-8:]=='adm0.shp':
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


iter = v_layer.getFeatures()
for feature in iter:
    # retrieve every feature with its geometry and attributes
    # fetch geometry
    geom = feature.geometry()
    print "Feature ID %d: " % feature.id()
    print(feature['ISO'])
    # show some information about the feature
    if geom.type() == QGis.Point:
        x = geom.asPoint()
        print "Point: " + str(x)
    elif geom.type() == QGis.Line:
        x = geom.asPolyline()
        print "Line: %d points" % len(x)
    elif geom.type() == QGis.Polygon:
        x = geom.asPolygon()
        numPts = 0
        for ring in x:
            numPts += len(ring)
        print "Polygon: %d rings with %d points" % (len(x), numPts)
    else:
        print "Unknown"
    
# Selecting and zooming aver feaures
 v_layer.select(5)
box = v_layer.boundingBoxOfSelected()
iface.mapCanvas().setExtent(box)
iface.mapCanvas().refresh()
