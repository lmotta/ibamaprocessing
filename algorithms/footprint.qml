<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="-4.65661e-10" version="3.4.4-Madeira" labelsEnabled="0" styleCategories="AllStyleCategories" minScale="1e+8" simplifyDrawingHints="1" simplifyMaxScale="1" readOnly="0" simplifyAlgorithm="0" simplifyLocal="1" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 forceraster="0" symbollevels="0" enableorderby="0" type="singleSymbol">
    <symbols>
      <symbol name="0" alpha="0.419608" force_rhr="0" type="fill" clip_to_extent="1">
        <layer enabled="1" class="SimpleFill" locked="0" pass="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="147,219,255,255"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.26"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="style" v="solid"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
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
    <DiagramCategory opacity="1" labelPlacementMethod="XHeight" enabled="0" penColor="#000000" scaleDependency="Area" rotationOffset="270" scaleBasedVisibility="0" penAlpha="255" sizeType="MM" minScaleDenominator="-4.65661e-10" sizeScale="3x:0,0,0,0,0,0" penWidth="0" minimumSize="0" lineSizeScale="3x:0,0,0,0,0,0" height="15" maxScaleDenominator="1e+8" backgroundAlpha="255" lineSizeType="MM" diagramOrientation="Up" barWidth="5" width="15" backgroundColor="#ffffff">
      <fontProperties description="Noto Sans,10,-1,0,50,0,0,0,0,0,Regular" style="Regular"/>
      <attribute field="" color="#000000" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings linePlacementFlags="18" placement="1" priority="0" obstacle="0" dist="0" zIndex="0" showAll="1">
    <properties>
      <Option type="Map">
        <Option name="name" value="" type="QString"/>
        <Option name="properties"/>
        <Option name="type" value="collection" type="QString"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
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
            <Option name="IsMultiline" value="true" type="bool"/>
            <Option name="UseHtml" value="true" type="bool"/>
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
    <alias field="name" name="" index="0"/>
    <alias field="pathfile" name="" index="1"/>
    <alias field="metadata" name="" index="2"/>
    <alias field="metadata_html" name="" index="3"/>
    <alias field="metadata_size" name="" index="4"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="name" expression="" applyOnUpdate="0"/>
    <default field="pathfile" expression="" applyOnUpdate="0"/>
    <default field="metadata" expression="" applyOnUpdate="0"/>
    <default field="metadata_html" expression="" applyOnUpdate="0"/>
    <default field="metadata_size" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint field="name" constraints="0" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint field="pathfile" constraints="0" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint field="metadata" constraints="0" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint field="metadata_html" constraints="0" notnull_strength="0" unique_strength="0" exp_strength="0"/>
    <constraint field="metadata_size" constraints="0" notnull_strength="0" unique_strength="0" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="name" exp="" desc=""/>
    <constraint field="pathfile" exp="" desc=""/>
    <constraint field="metadata" exp="" desc=""/>
    <constraint field="metadata_html" exp="" desc=""/>
    <constraint field="metadata_size" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
    <actionsetting action="from qgis import utils as QgsUtils&#xa;from ibamaprocessing.algorithms.footprint_algorithm import StyleOutputFootPrint&#xa;&#xa;nameAction = 'zoom'&#xa;params = {&#xa;    'layer_id': '[% @layer_id %]',&#xa;    'feature_id':[% $id %], &#xa;}&#xa;r = StyleOutputFootPrint.actions( nameAction, params )&#xa;if not r['isOk']:&#xa;  msgBar =  QgsUtils.iface.messageBar()&#xa;  title = &quot;Action {}&quot;.format( nameAction )&#xa;  msgBar.pushCritical( title,  r['message'] )&#xa;" name="Zoom Image" capture="0" icon="" shortTitle="Zoom Image" notificationMessage="" id="{e747cde0-5d2c-40fd-b7a4-2254d5b1589e}" isEnabledOnlyWhenEditable="0" type="1">
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting action="from qgis import utils as QgsUtils&#xa;from ibamaprocessing.algorithms.footprint_algorithm import StyleOutputFootPrint&#xa;&#xa;nameAction = 'highlight'&#xa;params = {&#xa;    'layer_id': '[% @layer_id %]',&#xa;    'feature_id':[% $id %], &#xa;}&#xa;r = StyleOutputFootPrint.actions( nameAction, params )&#xa;if not r['isOk']:&#xa;  msgBar =  QgsUtils.iface.messageBar()&#xa;  title = &quot;Action {}&quot;.format( nameAction )&#xa;  msgBar.pushCritical( title,  r['message'] )&#xa;" name="Highlight Image" capture="0" icon="" shortTitle="Highlight Image" notificationMessage="" id="{cf6f729d-976d-4988-8f05-9c186a84bb22}" isEnabledOnlyWhenEditable="0" type="1">
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting action="from qgis import utils as QgsUtils&#xa;from ibamaprocessing.algorithms.footprint_algorithm import StyleOutputFootPrint&#xa;&#xa;nameAction = 'show_hideImage'&#xa;params = {&#xa;    'layer_id': '[% @layer_id %]',&#xa;    'feature_id':[% $id %], &#xa;}&#xa;r = StyleOutputFootPrint.actions( nameAction, params )&#xa;if not r['isOk']:&#xa;  msgBar =  QgsUtils.iface.messageBar()&#xa;  title = &quot;Action {}&quot;.format( nameAction )&#xa;  msgBar.pushCritical( title,  r['message'] )&#xa;" name="Show/Hide Image" capture="0" icon="" shortTitle="Show/Hide Image" notificationMessage="" id="{b3030c13-5dd0-4618-82d0-e7b49364c361}" isEnabledOnlyWhenEditable="0" type="1">
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting action="from qgis import utils as QgsUtils&#xa;from ibamaprocessing.algorithms.footprint_algorithm import StyleOutputFootPrint&#xa;&#xa;nameAction = 'setCurrent'&#xa;params = {&#xa;    'layer_id': '[% @layer_id %]',&#xa;    'feature_id':[% $id %], &#xa;}&#xa;r = StyleOutputFootPrint.actions( nameAction, params )&#xa;if not r['isOk']:&#xa;  msgBar =  QgsUtils.iface.messageBar()&#xa;  title = &quot;Action {}&quot;.format( nameAction )&#xa;  msgBar.pushCritical( title,  r['message'] )&#xa;" name="Current Image" capture="0" icon="" shortTitle="Current Image" notificationMessage="" id="{82d374f6-bef7-413b-af26-1f2bfa16864d}" isEnabledOnlyWhenEditable="0" type="1">
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting action="from qgis import utils as QgsUtils&#xa;from ibamaprocessing.algorithms.footprint_algorithm import StyleOutputFootPrint&#xa;&#xa;nameAction = 'setZeroTransparency'&#xa;params = {&#xa;    'layer_id': '[% @layer_id %]'&#xa;}&#xa;r = StyleOutputFootPrint.actions( nameAction, params )&#xa;if not r['isOk']:&#xa;  msgBar =  QgsUtils.iface.messageBar()&#xa;  title = &quot;Action {}&quot;.format( nameAction )&#xa;  msgBar.pushCritical( title,  r['message'] )&#xa;" name="Zero Transparency" capture="0" icon="" shortTitle="Zero Transparency" notificationMessage="" id="{4fe2d548-d6e2-4f02-a0d1-c47caa05095e}" isEnabledOnlyWhenEditable="0" type="1">
      <actionScope id="Layer"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="">
    <columns>
      <column name="name" hidden="0" type="field" width="-1"/>
      <column hidden="1" type="actions" width="-1"/>
      <column name="pathfile" hidden="0" type="field" width="-1"/>
      <column name="metadata" hidden="0" type="field" width="-1"/>
      <column name="metadata_html" hidden="0" type="field" width="-1"/>
      <column name="metadata_size" hidden="0" type="field" width="-1"/>
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
    <field name="filename" editable="1"/>
    <field name="meta_html" editable="1"/>
    <field name="meta_jsize" editable="1"/>
    <field name="meta_json" editable="1"/>
    <field name="metadata" editable="0"/>
    <field name="metadata_html" editable="0"/>
    <field name="metadata_size" editable="0"/>
    <field name="name" editable="1"/>
    <field name="pathfile" editable="1"/>
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
