# -*- coding: utf-8 -*-
"""
/***************************************************************************
Name                 : Map Canvas Feature
Description          : Tools for show the geometry of feature
Date                 : January, 2019
copyright            : (C) 2019 by Luiz Motta
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
__date__ = '2019-01-31'
__copyright__ = '(C) 2019, Luiz Motta'
__revision__ = '$Format:%H$'

from qgis import utils as QgsUtils
from qgis.core import QgsProject, QgsCoordinateTransform

class  MapCanvasFeature():
    def __init__(self):
        self.project = QgsProject().instance()
        self.canvas = QgsUtils.iface.mapCanvas()
        
    def flash(self, layer, feature):
        self.canvas.flashGeometries( [ feature.geometry() ], layer.crs() )

    def zoom(self, layer, feature):
        def getBoudingBoxGeomCanvas():
            geom = feature.geometry()
            crsLayer = layer.crs()
            crsCanvas = self.project.crs()
            if not crsLayer == crsCanvas:
                ct = QgsCoordinateTransform( layer.crs(), self.project.crs(), self.project )
                bbox = ct.transform( geom.boundingBox() )
            else:
                bbox = geom.boundingBox()
            return bbox

        if not feature.hasGeometry():
            return
        self.canvas.setExtent( getBoudingBoxGeomCanvas() )
        self.canvas.zoomByFactor( 1.05 )
        self.canvas.refresh()
        self.flash( layer, feature )
