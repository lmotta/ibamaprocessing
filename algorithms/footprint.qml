<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" simplifyMaxScale="1" labelsEnabled="0" simplifyDrawingTol="1" minScale="1e+8" styleCategories="AllStyleCategories" maxScale="-4.65661e-10" simplifyDrawingHints="1" version="3.4.4-Madeira" simplifyAlgorithm="0" readOnly="0" simplifyLocal="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 enableorderby="0" symbollevels="0" type="singleSymbol" forceraster="0">
    <symbols>
      <symbol type="fill" name="0" alpha="0.419608" clip_to_extent="1" force_rhr="0">
        <layer class="SimpleFill" pass="0" enabled="1" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="147,219,255,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <property key="dualview/previewExpressions">
      <value>name</value>
    </property>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory labelPlacementMethod="XHeight" backgroundColor="#ffffff" lineSizeType="MM" rotationOffset="270" scaleBasedVisibility="0" height="15" diagramOrientation="Up" minScaleDenominator="-4.65661e-10" penColor="#000000" minimumSize="0" width="15" opacity="1" enabled="0" backgroundAlpha="255" penWidth="0" penAlpha="255" scaleDependency="Area" maxScaleDenominator="1e+8" sizeType="MM" lineSizeScale="3x:0,0,0,0,0,0" barWidth="5" sizeScale="3x:0,0,0,0,0,0">
      <fontProperties style="Regular" description="Noto Sans,10,-1,0,50,0,0,0,0,0,Regular"/>
      <attribute label="" color="#000000" field=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings zIndex="0" placement="1" obstacle="0" dist="0" priority="0" showAll="1" linePlacementFlags="18">
    <properties>
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option name="properties"/>
        <Option type="QString" name="type" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="name">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="pathfile">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="metadata">
      <editWidget type="Hidden">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="metadata_html">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="true"/>
            <Option type="bool" name="UseHtml" value="true"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="metadata_size">
      <editWidget type="Hidden">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="name"/>
    <alias name="" index="1" field="pathfile"/>
    <alias name="" index="2" field="metadata"/>
    <alias name="" index="3" field="metadata_html"/>
    <alias name="" index="4" field="metadata_size"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" expression="" field="name"/>
    <default applyOnUpdate="0" expression="" field="pathfile"/>
    <default applyOnUpdate="0" expression="" field="metadata"/>
    <default applyOnUpdate="0" expression="" field="metadata_html"/>
    <default applyOnUpdate="0" expression="" field="metadata_size"/>
  </defaults>
  <constraints>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="name"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="pathfile"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="metadata"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="metadata_html"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="metadata_size"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="name"/>
    <constraint exp="" desc="" field="pathfile"/>
    <constraint exp="" desc="" field="metadata"/>
    <constraint exp="" desc="" field="metadata_html"/>
    <constraint exp="" desc="" field="metadata_size"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
    <actionsetting shortTitle="" capture="0" type="1" name="Zoom Image" action="from qgis import utils as QgsUtils&#xa;from ibamaprocessing.algorithms.footprint_algorithm import StyleOutputFootPrint&#xa;&#xa;nameAction = 'zoom'&#xa;r = StyleOutputFootPrint.actions( nameAction, '[% @layer_id %]', [% $id %] )&#xa;if not r['isOk']:&#xa;  msgBar =  QgsUtils.iface.messageBar()&#xa;  title = &quot;Action {}&quot;.format( nameAction )&#xa;  msgBar.pushCritical( title,  r['message'] )&#xa;" isEnabledOnlyWhenEditable="0" icon="" notificationMessage="" id="{2a39b4f0-8199-4388-89f7-d6c90d796d71}">
      <actionScope id="Canvas"/>
      <actionScope id="Field"/>
      <actionScope id="Feature"/>
      <actionScope id="Layer"/>
    </actionsetting>
    <actionsetting shortTitle="" capture="0" type="1" name="Highlight Image" action="from qgis import utils as QgsUtils&#xa;from ibamaprocessing.algorithms.footprint_algorithm import StyleOutputFootPrint&#xa;&#xa;nameAction = 'highlight'&#xa;r = StyleOutputFootPrint.actions( nameAction, '[% @layer_id %]', [% $id %] )&#xa;if not r['isOk']:&#xa;  msgBar =  QgsUtils.iface.messageBar()&#xa;  title = &quot;Action {}&quot;.format( nameAction )&#xa;  msgBar.pushCritical( title,  r['message'] )&#xa;" isEnabledOnlyWhenEditable="0" icon="" notificationMessage="" id="{0cb88c5d-a44c-4265-b291-6cebde77b4fb}">
      <actionScope id="Canvas"/>
      <actionScope id="Field"/>
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting shortTitle="" capture="0" type="1" name="Show/Hide Image" action="from qgis import utils as QgsUtils&#xa;from ibamaprocessing.algorithms.footprint_algorithm import StyleOutputFootPrint&#xa;&#xa;nameAction = 'show_hideImage'&#xa;r = StyleOutputFootPrint.actions( nameAction, '[% @layer_id %]', [% $id %] )&#xa;if not r['isOk']:&#xa;  msgBar =  QgsUtils.iface.messageBar()&#xa;  title = &quot;Action {}&quot;.format( nameAction )&#xa;  msgBar.pushCritical( title,  r['message'] )&#xa;" isEnabledOnlyWhenEditable="0" icon="" notificationMessage="" id="{b44025e3-077c-4b90-95a9-7246357a68b0}">
      <actionScope id="Canvas"/>
      <actionScope id="Field"/>
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting shortTitle="" capture="0" type="1" name="Set Current Image" action="from qgis import utils as QgsUtils&#xa;from ibamaprocessing.algorithms.footprint_algorithm import StyleOutputFootPrint&#xa;&#xa;nameAction = 'setCurrent'&#xa;r = StyleOutputFootPrint.actions( nameAction, '[% @layer_id %]', [% $id %] )&#xa;if not r['isOk']:&#xa;  msgBar =  QgsUtils.iface.messageBar()&#xa;  title = &quot;Action {}&quot;.format( nameAction )&#xa;  msgBar.pushCritical( title,  r['message'] )&#xa;" isEnabledOnlyWhenEditable="0" icon="" notificationMessage="" id="{632fab38-951a-4ee8-bb85-5b48a1aa4fad}">
      <actionScope id="Canvas"/>
      <actionScope id="Field"/>
      <actionScope id="Feature"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="" sortOrder="0">
    <columns>
      <column hidden="0" type="field" width="-1" name="name"/>
      <column hidden="1" type="actions" width="-1"/>
      <column hidden="0" type="field" width="-1" name="pathfile"/>
      <column hidden="0" type="field" width="-1" name="metadata"/>
      <column hidden="0" type="field" width="-1" name="metadata_html"/>
      <column hidden="0" type="field" width="-1" name="metadata_size"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- codificação: utf-8 -*-
"""
Os formulários do QGIS podem ter uma função Python que é chamada quando
o formulário
 é aberto.

QGIS forms can have a Python function that is called when the form is
opened.

Use esta função para adicionar lógica extra aos seus formulários.

Entre com o nome da função no campo "Python Init function".
Un exemplo a seguir:
"""
a partir de PyQt4.QtGui importe QWidget

def my_form_open(diálogo, camada, feição):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field editable="1" name="filename"/>
    <field editable="1" name="meta_html"/>
    <field editable="1" name="meta_jsize"/>
    <field editable="1" name="meta_json"/>
    <field editable="0" name="metadata"/>
    <field editable="0" name="metadata_html"/>
    <field editable="0" name="metadata_size"/>
    <field editable="1" name="name"/>
    <field editable="1" name="pathfile"/>
  </editable>
  <labelOnTop>
    <field name="filename" labelOnTop="0"/>
    <field name="meta_html" labelOnTop="0"/>
    <field name="meta_jsize" labelOnTop="0"/>
    <field name="meta_json" labelOnTop="0"/>
    <field name="metadata" labelOnTop="0"/>
    <field name="metadata_html" labelOnTop="1"/>
    <field name="metadata_size" labelOnTop="0"/>
    <field name="name" labelOnTop="0"/>
    <field name="pathfile" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>name</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
