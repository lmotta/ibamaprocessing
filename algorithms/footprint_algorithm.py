# -*- coding: utf-8 -*-
"""
/***************************************************************************
Name                 : Image Footprint Tool
Description          : Tool for create a catalog layer from directories of images
Date                 : July, 2016, Migrate for Processing in January, 2019
copyright            : (C) 2016 by Luiz Motta
email                : motta.luiz@gmail.com

 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
"""

__author__ = 'Luiz Motta'
__date__ = 'January 2019'
__copyright__ = '(C) 2019, Luiz Motta'
__revision__ = '$Format:%H$'

from qgis.PyQt.QtCore import (
    QCoreApplication,
    QDir, QDirIterator,
    QFileInfo, 
    QVariant
)
from qgis.PyQt.QtGui import QIcon

from qgis.core import (
    QgsProcessingAlgorithm, QgsProcessing,
    QgsProcessingParameterFile, QgsProcessingParameterBoolean, QgsProcessingParameterString, QgsProcessingParameterEnum,
    QgsProcessingParameterCrs, QgsProcessingParameterNumber, QgsProcessingParameterFeatureSink,
    QgsFeatureSink,
    QgsCoordinateReferenceSystem, QgsCoordinateTransform, QgsCoordinateTransformContext,
    QgsRectangle, QgsGeometry,
    QgsFeature, QgsField, QgsFields, QgsWkbTypes,
    QgsCsException
)

import numpy as np
import os, json

from osgeo import gdal, ogr, osr
from gdalconst import GA_ReadOnly
gdal.UseExceptions()
gdal.PushErrorHandler('CPLQuietErrorHandler')

import datetime
class FileDebug():
    pathfile = '/home/lmotta/temp/plugin_debug.txt'
    @staticmethod
    def init():
        fileDebug = open( FileDebug.pathfile, 'w')
        timeNow = str(datetime.datetime.now())
        msg = "DEBUG - {}\n".format( timeNow )
        fileDebug.write( msg )
        fileDebug.close()
    @staticmethod
    def write(message):
        fileDebug = open( FileDebug.pathfile, 'a')
        timeNow = str(datetime.datetime.now())
        fileDebug.write( "{} - {}\n".format( message, timeNow ) )
        fileDebug.close()

#FileDebug.init()
#FileDebug.write()

class FootPrint():
    @staticmethod
    def getParamsFeatureSink():
        fields = QgsFields()
        fields.append( QgsField( 'pathfile', QVariant.String, len=250 ) )
        fields.append( QgsField( 'metadata', QVariant.String, len=500 ) )
        fields.append( QgsField( 'metadata_html', QVariant.String, len=500 ) )
        fields.append( QgsField( 'metadata_size', QVariant.Int ) )
        return { 'fields': fields, 'wkbType': QgsWkbTypes.MultiPolygon }

    @staticmethod
    def getAuthority(crs):
        if not isinstance( crs, QgsCoordinateReferenceSystem ):
            defCRS = "WKT:{}".format( crs )
            crs = QgsCoordinateReferenceSystem( defCRS )
        isProjected = not crs.isGeographic()
        return { 'auth': crs.authid(), 'isProjected': isProjected }

    def __init__(self, featureSink, feedback):
        self.infoImages = []
        self.featureSink = featureSink
        self.feedback = feedback
        self.countErrorInfoArea = 0
        self.countErrorInfoGeom = 0
        self.countNoneInfoArea = 0

        # InfoImage = {
        #  'area':  { 'auth', 'value' }
        #  'bands'  { ''total', 'types' }
        #  'crs':   { 'auth', 'isProjected' }
        #  'drive'
        #  'sizes': { 'pixel': { 'resolutionX', 'resolutionY' }, 'raster': { 'pixelsX', 'pixelsY' } }
        # }
        # Temporary keys: { 'pathfile', 'bbox_wkt', 'geom' }

    def setInfoImages(self, pathRoot, hasSubdirectories, filterNames=None, reverse=False):
        def getGeorefenceDataSet(pathfile):
            try:
                ds = gdal.Open( pathfile, GA_ReadOnly )
            except RuntimeError:
                return None
            wkt = ds.GetProjectionRef()
            if len( wkt ) == 0:
                ds = None
                return None
            return ds

        def addImage(ds):
            def getBands(ds):
                total = ds.RasterCount
                bands = []
                for idx in range( ds.RasterCount ):
                    band = ds.GetRasterBand( idx+1 )
                    info = "B{}({})".format( idx+1, gdal.GetDataTypeName( band.DataType ) )
                    bands.append( info )
                return { 'total': total, 'types': ",".join( bands ) }

            def getSizesBoundingBox(ds):
                def getBBox(sizePixel, sizeRaster, rotation ):
                    xMin, yMax = coefs[0], coefs[3]
                    xMax = xMin +   ( sizeRaster['pixelsX'] * sizePixel['resolutionX'] ) + ( sizeRaster['pixelsY'] * rotation['x'] )
                    yMin = yMax - ( ( sizeRaster['pixelsY'] * sizePixel['resolutionY'] ) + ( sizeRaster['pixelsX'] * rotation['y'] ) )
                    rect = QgsRectangle( xMin, yMin, xMax, yMax )
                    return rect.asWktPolygon()
                # coefs: 0 = ulX, 1 = resolutionX, 2 = rotationX, 3 = ulY, 4 = rotationY, 5 = resolutionY(Negative)
                coefs = ds.GetGeoTransform()
                sizes = {
                    'pixel': { 'resolutionX': coefs[1], 'resolutionY': -1 * coefs[5] },
                    'raster': { 'pixelsX': ds.RasterXSize, 'pixelsY': ds.RasterYSize }
                }
                rotation = { 'x': coefs[2], 'y': coefs[4] }
                bbox = getBBox( sizes['pixel'], sizes['raster'], rotation )
                return sizes, bbox

            wkt = ds.GetProjectionRef()
            crs = self.getAuthority( wkt )
            sizes, bbox = getSizesBoundingBox( ds )
            item = {
                'pathfile': ds.GetDescription(),
                'crs': crs,
                'bands': getBands( ds ),
                'sizes': sizes,
                'bbox_wkt': bbox,
                'drive': ds.GetDriver().GetDescription()
            }
            ds = None #close
            self.infoImages.append( item )
            return { 'isOk': True }

        del self.infoImages[:]
        filters = QDir.Files
        flags = QDirIterator.Subdirectories if hasSubdirectories else QDirIterator.NoIteratorFlags

        iter = QDirIterator(  pathRoot, [], filters, flags )
        if reverse and not filterNames is None:
            while iter.hasNext():
                pathfile = iter.next()
                pathfileUpper = QFileInfo( pathfile ).fileName().upper()
                if any ( name.upper() in pathfileUpper for name in filterNames ):
                    continue
                ds = getGeorefenceDataSet( pathfile )
                if ds is None:
                    continue
                r = addImage( ds )
                if not r['isOk']:
                    msg = "{}. '{}'".format( r['message'], pathfile )
                    self.feedback.reportError( msg )
                if self.feedback.isCanceled():
                    break

        else:
            if not filterNames is None:
                fn = [ "*{}*".format( n ) for n in filterNames ]
                iter = QDirIterator(  pathRoot, fn, filters, flags )
            while iter.hasNext():
                pathfile = iter.next()
                ds = getGeorefenceDataSet( pathfile )
                if ds is None:
                    continue
                r = addImage( ds )
                if not r['isOk']:
                    msg ="{}. '{}'".format( r['message'], pathfile )
                    self.feedback.reportError( msg )
                if self.feedback.isCanceled():
                    break

    def setGeometryArea(self, crsTo, crsArea, paramsValidPixels=None):
        def getGeometryTransform(info, crsDest, authDest, geom, hasCopy=False):
            crsSource = QgsCoordinateReferenceSystem( info['crs']['auth'] )
            ct =  QgsCoordinateTransform( crsSource, crsDest,  QgsCoordinateTransformContext() )
            geomTrasform = QgsGeometry( geom ) if hasCopy else geom
            try:
                geomTrasform.transform( ct )
            except QgsCsException:
                msg = QCoreApplication.translate('Footprint', 'Error for geometry transform {}->{}')
                msg = msg.format( info['crs']['auth'], authDest )
                return { 'isOk': False, 'message': msg }
            return { 'isOk': True,'geom': geomTrasform }

        def setInfoArea(info, geom):
            if info['crs']['isProjected']:
                info['area'] = { 'value': geom.area(), 'auth':  info['crs']['auth'] }
            else:
                if not crsArea is None:
                    r = getGeometryTransform( info, crsArea, authArea, geom, True )
                    if not r['isOk']:
                        info['area'] = { 'value': None, 'auth': authArea, 'message': r['message'] }
                        self.countErrorInfoArea += 1
                    else:
                        area = r['geom'].area()
                        r['geom'] = None
                        info['area'] = { 'value': area, 'auth': authArea }
                else:
                    msg = QCoreApplication.translate('Footprint', 'User not define a CRS for Area')
                    info['area'] = { 'value': None, 'auth': None, 'message': msg }
                    self.countNoneInfoArea += 1

        def setInfoGeometry(info, geom):
            r = getGeometryTransform( info, crsTo, authTo, geom )
            if not r['isOk']:
                info['geom'] = { 'value': None, 'message': r['message'] }
                self.countErrorInfoGeom += 1
            else:
                info['geom'] = { 'value': r['geom'] }

        def getHtmlTreeMetadata(value, html):
            if isinstance( value, dict ):
                html += "<ul>"
                for key, val in sorted( value.items() ):
                    if not isinstance( val, dict ):
                        html += "<li>%s: %s</li> " % ( key, val )
                    else:
                        html += "<li>%s</li> " % key
                    html = getHtmlTreeMetadata( val, html )
                html += "</ul>"
                return html
            return html

        def setGeometryBBox(info):
            geomOGR = ogr.Geometry( ogr.wkbMultiPolygon )
            geomOGR.AddGeometry( ogr.CreateGeometryFromWkt( info['bbox_wkt'] ) )
            del info['bbox_wkt']
            geom = QgsGeometry.fromWkt( geomOGR.ExportToWkt() )
            setInfoArea( info, geom )
            setInfoGeometry( info, geom )

        def setGeometryValidPixels(info):
            def setError(message):
                info['geom'] = { 'value': None, 'message': message }
                info['area'] = { 'value': None, 'auth': authArea }
                self.countErrorInfoGeom += 1

            def getDataSetRasterMemory(dsIn):
                drv_mem = gdal.GetDriverByName('MEM')
                ds = drv_mem.Create( '', dsIn.RasterXSize, dsIn.RasterYSize, 1, gdal.GDT_Byte )
                if ds is None:
                    msg = QCoreApplication.translate('Footprint', 'Error create Raster memory' )
                    return { 'isOk': False, 'message': msg }
                ds.SetGeoTransform( dsIn.GetGeoTransform() )
                ds.SetProjection( dsIn.GetProjection() )
                return { 'isOk': True, 'ds': ds }
            
            def getDataSetBandMaskMemory(dsIn):
                def writeValidPixels(band):
                    arryBand = np.array( dsIn.GetRasterBand(1).ReadAsArray() )
                    arryValid = arryBand != paramsValidPixels['nodata']
                    del arryBand
                    band.WriteArray( arryValid )
                    del arryValid
                    band.SetNoDataValue( paramsValidPixels['nodata'] )

                r = getDataSetRasterMemory( dsIn )
                if not r['isOk']:
                    return r
                dsMask = r['ds']
                bandMask = dsMask.GetRasterBand(1)
                writeValidPixels( bandMask )
                return { 'isOk': True, 'ds': dsMask, 'band': bandMask }

            def getDataSetLayerPolygonMaskMemory(wktSrs):
                srs = osr.SpatialReference()
                srs.ImportFromWkt( wktSrs )
                driver = ogr.GetDriverByName('MEMORY')
                ds = driver.CreateDataSource('memData')
                if ds is None:
                    msg = QCoreApplication.translate('Footprint', 'Error create Polygon layer memory' )
                    return { 'isOk': False, 'message': msg }
                layer = ds.CreateLayer('memLayer', srs, ogr.wkbPolygon )
                field = ogr.FieldDefn("dn", ogr.OFTInteger)
                layer.CreateField( field )
                return { 'isOk': True, 'ds': ds, 'layer': layer }

            try:
                ds = gdal.Open( info['pathfile'], GA_ReadOnly )
            except RuntimeError as error:
                setError( str( error ) )
                return

            # Mask
            r = getDataSetBandMaskMemory( ds )
            if not r['isOk']:
                setError( r['message'] )
                return
            dsMask, bandMask = r['ds'], r['band']
            ds = None

            # Sieve
            r = getDataSetRasterMemory( dsMask )
            if not r['isOk']:
                setError( r['message'] )
                return
            dsSieve = r['ds']
            bandSieve = dsSieve.GetRasterBand(1)
            threshold, connectedness = 100, 8
            try:
                gdal.SieveFilter( bandMask, None, bandSieve, threshold, connectedness, [], callback=None )
            except RuntimeError as error:
                setError( str( error ) )
                return
            dsMask, bandMask = None, None

            # Polygonize
            r = getDataSetLayerPolygonMaskMemory( dsSieve.GetProjection() )
            if not r['isOk']:
                setError( r['message'] )
                return
            dsPolygonMask, layerMask = r['ds'], r['layer']
            idField = 0
            try:
                gdal.Polygonize( bandSieve, None, layerMask, idField, [], callback=None )
            except RuntimeError as error:
                setError( str( error ) )
                return
            dsSieve, bandSieve = None, None

            # Geometry
            geomsOGR = []
            layerMask.SetAttributeFilter("dn = 1")
            for feat in layerMask:
                outerRing = feat.GetGeometryRef().GetGeometryRef(0)
                poly = ogr.Geometry( ogr.wkbPolygon )
                poly.AddGeometry( outerRing )
                geomsOGR.append( poly )
            dsPolygonMask, layerMask = None, None

            # Union Geos
            geomUnion = ogr.Geometry( ogr.wkbMultiPolygon )
            for idx in range( len( geomsOGR ) ):
                geomUnion.AddGeometry( geomsOGR[ idx ] )
                geomsOGR[ idx ].Destroy()
            del geomsOGR[:]
            geomOGR = geomUnion.UnionCascaded()
            geomUnion.Destroy()

            # set Info
            del info['bbox_wkt']
            geom = QgsGeometry.fromWkt( geomOGR.ExportToWkt() )
            setInfoArea( info, geom )
            geom_s = geom.simplify( paramsValidPixels['tolerance'] )
            setInfoGeometry( info, geom_s )

        if len( crsArea.toWkt() ) == 0:
            crsArea = None
            authArea = None
        else:
            r = self.getAuthority( crsArea )
            authArea = r['auth']
            
        r = self.getAuthority( crsTo )
        authTo = r['auth']

        self.countErrorInfoArea, self.countErrorInfoGeom, self.countNoneInfoArea = 0, 0, 0
        fields = self.getParamsFeatureSink()['fields']
        setGeometryInfo = setGeometryBBox if paramsValidPixels is None else setGeometryValidPixels
        countProgress = 0
        totalProgress = 100.0 / len( self.infoImages )
        for info in self.infoImages:
            if self.feedback.isCanceled():
                break
            setGeometryInfo( info )
            feat = QgsFeature( fields )
            if not info['geom']['value'] is None:
                feat.setGeometry( info['geom']['value'] )
                info['geom']['value'] = True
            else:
                info['geom']['value'] = False
            feat.setAttribute('pathfile', info['pathfile'] )
            del info['pathfile']
            metadata_html = getHtmlTreeMetadata( info, '' )
            metadata = json.dumps( info )
            feat.setAttribute('metadata', metadata )
            feat.setAttribute('metadata_html', metadata_html )
            feat.setAttribute('metadata_size', len( metadata_html ) )
            self.featureSink.addFeature( feat, QgsFeatureSink.FastInsert )
            countProgress += 1
            if countProgress % 5 == 0:
                self.feedback.setProgress( int( countProgress * totalProgress ) )
        if self.feedback.isCanceled():
            msg = QCoreApplication.translate('Footprint', 'Canceled by user')
            self.feedback.reportError( msg )
        if self.countErrorInfoArea > 0:
            msg = QCoreApplication.translate('Footprint', 'Total error for calculate area: {}. Expression for the filter:\n{}')
            sfilter = """map_get( map_get( json_to_map("metadata"), 'area'), 'value' ) IS None"""
            msg = msg.format( self.countErrorInfoArea, sfilter )
            self.feedback.reportError( msg )
        if self.countNoneInfoArea > 0:
            msg = QCoreApplication.translate('Footprint', 'Total None CRS area: {}. Expression for the filter:\n{}')
            sfilter = """map_get( map_get( json_to_map("metadata"), 'area'), 'auth' ) IS None"""
            msg = msg.format( self.countNoneInfoArea, sfilter )
            self.feedback.pushInfo( msg )
        if self.countErrorInfoGeom > 0:
            msg = QCoreApplication.translate('Footprint', 'Total error for calculate geometry: {}. Expression for the filter:\n{}')
            sfilter = """map_get( map_get( json_to_map("metadata"), 'geom'), 'value' ) IS None"""
            msg = msg.format( self.countErrorInfoGeom, sfilter )
            self.feedback.reportError( msg )


class FootprintAlgorithm(QgsProcessingAlgorithm):
    INPUT_DIRECTORY_IMAGES = 'INPUT_DIRECTORY_IMAGES'
    INPUT_SUBDIRECTORIES = 'INPUT_SUBDIRECTORIES'
    INPUT_FILTER_NAMES= 'INPUT_FILTER_NAMES'
    INPUT_REVERSE = 'INPUT_REVERSE'
    INPUT_CRS_AREA = 'INPUT_CRS_AREA'
    INPUT_CALCULATE = 'INPUT_VALID_PIXELS'
    INPUT_NODATA = 'INPUT_NODATA'
    INPUT_CRS_LAYER = 'INPUT_CRS_LAYER'
    OUTPUT_LAYER = 'OUTPUT_LAYER'

    def __init__(self):
        super().__init__()
        labelBbox = QCoreApplication.translate('Footprint', 'Bounding Box(quickly)')
        labelValidpixels = QCoreApplication.translate('Footprint', 'Valid pixels(slower)')
        self.typesCalculate = { 0: labelBbox, 1: labelValidpixels }

    def name(self):
        return "Footprint"
    
    def icon(self):
        pluginPath = os.path.dirname(__file__)
        return QIcon( os.path.join( pluginPath, 'footprint.svg') )

    def displayName(self):
        return QCoreApplication.translate('Footprint', 'Create footprint of images')

    def group(self):
        return QCoreApplication.translate('Footprint', self.groupId() )

    def groupId(self):
        return 'Raster'

    def tags(self):
        return QCoreApplication.translate('Footprint', 'IBAMA,image,raster,catalog').split(',')

    def shortHelpString(self):
        return QCoreApplication.translate('Footprint', """
        Calculate the footprints of georeferenced images.

        Usage:
        - Choice the directory of input images.
        - Mark subdirectories for do recursive search of images.
        - Add filter in search of images.
          Use ';' to separate the words.
          Ex.: filter1;filter2;filter3.
          If the word is contain inside the name of file, this image is selected.
        - Use the reverse of the filter to capture the opposite of the filters.
        - Select the CRS for the calculate of area.
          This CRS will be use if image not have the projected CRS.
        - Select the type of calculus of Footprint polygons:
          . Bounding Box.
          . Valid pixels: Calculates the image limit.
        - Value of NODATA: Use this value for the areas where not have value.
        - Select the CRS for the footprint layer.
        - Select the source for the output of footprint layer.
        """)

    def helpUrl(self):
        return 'https://github.com/lmotta/ibamaprocessing/wiki'
        
    def createInstance(self):
        return type(self)()
  
    def checkParameterValues(self, parameters, context):
        if parameters['INPUT_DIRECTORY_IMAGES'] is None or not QDir( parameters['INPUT_DIRECTORY_IMAGES'] ).exists():
            msg = QCoreApplication.translate('Footprint', 'Directory {} not exists')
            msg = msg.format( parameters['INPUT_DIRECTORY_IMAGES'] )
            return ( False, msg )
        
        r = FootPrint.getAuthority( parameters['INPUT_CRS_AREA'])
        if not r['isProjected']:
            msg = QCoreApplication.translate('Footprint', "CRS of area '{}' is not projected")
            msg = msg.format( parameters['INPUT_CRS_AREA'].authid(), msg)
            return ( False, msg )
        
        return ( True, None)
        
    def initAlgorithm(self, config=None):
        self.addParameter(
            QgsProcessingParameterFile(
                self.INPUT_DIRECTORY_IMAGES, QCoreApplication.translate('Footprint', 'Directory of input images'),
                QgsProcessingParameterFile.Folder
            )
        )
        self.addParameter(
            QgsProcessingParameterBoolean(
                self.INPUT_SUBDIRECTORIES,QCoreApplication.translate('Footprint', 'Search in subdirectories'),
                defaultValue=False
            )
        )
        self.addParameter(
            QgsProcessingParameterString(
                self.INPUT_FILTER_NAMES, QCoreApplication.translate('Footprint', "Filters for search(separate by ';')"),
                optional=True
            )
        )
        self.addParameter(
            QgsProcessingParameterBoolean(
                self.INPUT_REVERSE, QCoreApplication.translate('Footprint', 'Reverse of filters'),
                defaultValue=False
            )
        )
        self.addParameter(
            QgsProcessingParameterCrs(
                self.INPUT_CRS_AREA, QCoreApplication.translate('Footprint', 'CRS for calculate area(if CRS of image is not projected)'),
                optional=True
            )
        )
        self.addParameter(
            QgsProcessingParameterEnum(
                self.INPUT_CALCULATE, QCoreApplication.translate('Footprint', 'Type of calculus of Footprint polygons'),
                [ self.typesCalculate[0], self.typesCalculate[1] ], defaultValue=0
            )
        )
        self.addParameter(
            QgsProcessingParameterNumber(
                self.INPUT_NODATA, QCoreApplication.translate('Footprint', 'Value of NODATA(use by Valid pixels)'),
                QgsProcessingParameterNumber.Integer, 0
            )
        )
        self.addParameter(
            QgsProcessingParameterCrs(
                self.INPUT_CRS_LAYER, QCoreApplication.translate('Footprint', 'CRS of Footprint layer'),
                defaultValue='EPSG:4326'
            )
        )
        self.addParameter(
            QgsProcessingParameterFeatureSink(
                self.OUTPUT_LAYER, QCoreApplication.translate('Footprint', 'Footprint layer'),
                QgsProcessing.TypeVectorPolygon
            )
        )

    def processAlgorithm(self, parameters, context, feedback):
        directoryImages = self.parameterAsFile(parameters, self.INPUT_DIRECTORY_IMAGES, context )
        hasSubdirectories = self.parameterAsBool(parameters, self.INPUT_SUBDIRECTORIES, context )
        filterNames = self.parameterAsString(parameters, self.INPUT_FILTER_NAMES, context )
        hasReverse = self.parameterAsBool(parameters, self.INPUT_REVERSE, context )
        crsLayer = self.parameterAsCrs(parameters, self.INPUT_CRS_LAYER, context )
        crsArea = self.parameterAsCrs(parameters, self.INPUT_CRS_AREA, context )
        typeCalculate = self.parameterAsEnum(parameters, self.INPUT_CALCULATE, context )
        nodata = self.parameterAsInt(parameters, self.INPUT_NODATA, context )


        p = FootPrint.getParamsFeatureSink()
        (sink, dest_id) = self.parameterAsSink( parameters, self.OUTPUT_LAYER, context,
                                               fields=p['fields'], geometryType=p['wkbType'], crs=crsLayer )

        footprint = FootPrint(sink, feedback )

        msg = QCoreApplication.translate('Footprint', '1/2 Searching images...')
        feedback.setProgressText( msg )
        filterNames = [] if filterNames is None else filterNames.split(';')
        footprint.setInfoImages( directoryImages, hasSubdirectories, filterNames, hasReverse )
        if feedback.isCanceled():
            return { self.OUTPUT_LAYER: None }
        if len( footprint.infoImages ) == 0:
            msg = QCoreApplication.translate('Footprint','Missing images: {}!')
            msg = msg.format( directoryImages )
            feedback.reportError( msg )
            return { self.OUTPUT_LAYER: None }

        msg = QCoreApplication.translate('Footprint','2/2 Adding features({})...')
        msg = msg.format( len( footprint.infoImages ) )
        feedback.setProgressText( msg )
        paramsValidPixels = { 'nodata': nodata, 'tolerance': 0.1 }  if typeCalculate == 1 else None
        footprint.setGeometryArea( crsLayer, crsArea, paramsValidPixels )
        if feedback.isCanceled():
            return { self.OUTPUT_LAYER: None }

        return { self.OUTPUT_LAYER: dest_id }