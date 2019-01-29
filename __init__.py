# -*- coding: utf-8 -*-
"""
/***************************************************************************
Name                 : IBAMA processing tools
Description          : Processing tools
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
__date__ = '2019-01-29'
__copyright__ = '(C) 2019, Luiz Motta'
__revision__ = '$Format:%H$'


import os

from qgis.PyQt.QtGui import QIcon

from qgis.core import QgsProcessingProvider, QgsApplication

from .algorithms.footprint_algorithm import FootprintAlgorithm
from .translate import Translate


def classFactory(iface):
  return IbamaPlugin()

class IbamaPlugin(object):
    def __init__(self):
        self.provider = IbamaProvider()
        self.translate = Translate('ibamaprocessing')

    def initGui(self):
        QgsApplication.processingRegistry().addProvider( self.provider )

    def unload(self):
        QgsApplication.processingRegistry().removeProvider(self.provider)


class IbamaProvider(QgsProcessingProvider):
    def __init__(self):
        QgsProcessingProvider.__init__(self)

        self.alglist = [ FootprintAlgorithm() ]

    def unload(self):
        pass

    def loadAlgorithms(self):
        """
        Loads all algorithms belonging to this provider.
        """
        for alg in self.alglist:
            self.addAlgorithm( alg )

    def id(self):
        """
        Returns the unique provider id, used for identifying the provider. This
        string should be a unique, short, character only string, eg "qgis" or
        "gdal". This string should not be localised.
        """
        return 'ibama'

    def name(self):
        """
        Returns the provider name, which is used to describe the provider
        within the GUI.

        This string should be short (e.g. "Lastools") and localised.
        """
        return self.longName()

    def longName(self):
        """
        Returns the a longer version of the provider name, which can include
        extra details such as version numbers. E.g. "Lastools LIDAR tools
        (version 2.2.1)". This string should be localised. The default
        implementation returns the same string as name().
        """
        return 'IBAMA'

    def icon(self):
        iconPath = os.path.join( os.path.dirname(__file__), 'ibama.svg')
        return QIcon( iconPath )


