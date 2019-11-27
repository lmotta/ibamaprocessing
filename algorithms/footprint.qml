<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" simplifyMaxScale="1" maxScale="-4.65661e-10" simplifyLocal="1" version="3.4.13-Madeira" simplifyDrawingHints="1" minScale="1e+8" simplifyAlgorithm="0" styleCategories="AllStyleCategories" labelsEnabled="0" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 enableorderby="0" symbollevels="0" type="singleSymbol" forceraster="0">
    <symbols>
      <symbol name="0" clip_to_extent="1" force_rhr="0" alpha="0.419608" type="fill">
        <layer class="SimpleFill" enabled="1" pass="0" locked="0">
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
    <property value="name" key="dualview/previewExpressions"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory labelPlacementMethod="XHeight" enabled="0" maxScaleDenominator="1e+8" opacity="1" backgroundColor="#ffffff" scaleBasedVisibility="0" minScaleDenominator="-4.65661e-10" backgroundAlpha="255" height="15" penAlpha="255" sizeScale="3x:0,0,0,0,0,0" lineSizeScale="3x:0,0,0,0,0,0" barWidth="5" minimumSize="0" penColor="#000000" diagramOrientation="Up" scaleDependency="Area" penWidth="0" lineSizeType="MM" width="15" rotationOffset="270" sizeType="MM">
      <fontProperties description="Noto Sans,10,-1,0,50,0,0,0,0,0,Regular" style="Regular"/>
      <attribute field="" label="" color="#000000"/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings dist="0" linePlacementFlags="18" priority="0" obstacle="0" showAll="1" zIndex="0" placement="1">
    <properties>
      <Option type="Map">
        <Option name="name" value="" type="QString"/>
        <Option name="properties"/>
        <Option name="type" value="collection" type="QString"/>
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
    <default field="name" applyOnUpdate="0" expression=""/>
    <default field="pathfile" applyOnUpdate="0" expression=""/>
    <default field="metadata" applyOnUpdate="0" expression=""/>
    <default field="metadata_html" applyOnUpdate="0" expression=""/>
    <default field="metadata_size" applyOnUpdate="0" expression=""/>
  </defaults>
  <constraints>
    <constraint field="name" constraints="0" exp_strength="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="pathfile" constraints="0" exp_strength="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="metadata" constraints="0" exp_strength="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="metadata_html" constraints="0" exp_strength="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="metadata_size" constraints="0" exp_strength="0" unique_strength="0" notnull_strength="0"/>
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
    <actionsetting name="Zoom Image" capture="0" isEnabledOnlyWhenEditable="0" shortTitle="Zoom Image" action="from qgis import utils as QgsUtils&#xa;from ibamaprocessing.algorithms.footprint_algorithm import StyleOutputFootPrint&#xa;&#xa;nameAction = 'zoom'&#xa;params = {&#xa;    'layer_id': '[% @layer_id %]',&#xa;    'feature_id':[% $id %], &#xa;}&#xa;r = StyleOutputFootPrint.actions( nameAction, params )&#xa;if not r['isOk']:&#xa;  msgBar =  QgsUtils.iface.messageBar()&#xa;  title = &quot;Action {}&quot;.format( nameAction )&#xa;  msgBar.pushCritical( title,  r['message'] )&#xa;" icon="" notificationMessage="" id="{a1e5cad0-75b1-4e99-9ca8-3131110cbe69}" type="1">
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting name="Flash Image" capture="0" isEnabledOnlyWhenEditable="0" shortTitle="Flash Image" action="from qgis import utils as QgsUtils&#xa;from ibamaprocessing.algorithms.footprint_algorithm import StyleOutputFootPrint&#xa;&#xa;nameAction = 'flash'&#xa;params = {&#xa;    'layer_id': '[% @layer_id %]',&#xa;    'feature_id':[% $id %], &#xa;}&#xa;r = StyleOutputFootPrint.actions( nameAction, params )&#xa;if not r['isOk']:&#xa;  msgBar =  QgsUtils.iface.messageBar()&#xa;  title = &quot;Action {}&quot;.format( nameAction )&#xa;  msgBar.pushCritical( title,  r['message'] )&#xa;" icon="" notificationMessage="" id="{dd60c28e-0641-45c4-8ecd-1c76d9fbf2d5}" type="1">
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting name="Show/Hide Image" capture="0" isEnabledOnlyWhenEditable="0" shortTitle="Show/Hide Image" action="from qgis import utils as QgsUtils&#xa;from ibamaprocessing.algorithms.footprint_algorithm import StyleOutputFootPrint&#xa;&#xa;nameAction = 'show_hideImage'&#xa;params = {&#xa;    'layer_id': '[% @layer_id %]',&#xa;    'feature_id':[% $id %], &#xa;}&#xa;r = StyleOutputFootPrint.actions( nameAction, params )&#xa;if not r['isOk']:&#xa;  msgBar =  QgsUtils.iface.messageBar()&#xa;  title = &quot;Action {}&quot;.format( nameAction )&#xa;  msgBar.pushCritical( title,  r['message'] )&#xa;" icon="" notificationMessage="" id="{8e98f52b-c055-47f9-9629-408ce873b13f}" type="1">
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting name="Current Image" capture="0" isEnabledOnlyWhenEditable="0" shortTitle="Current Image" action="from qgis import utils as QgsUtils&#xa;from ibamaprocessing.algorithms.footprint_algorithm import StyleOutputFootPrint&#xa;&#xa;nameAction = 'setCurrent'&#xa;params = {&#xa;    'layer_id': '[% @layer_id %]',&#xa;    'feature_id':[% $id %], &#xa;}&#xa;r = StyleOutputFootPrint.actions( nameAction, params )&#xa;if not r['isOk']:&#xa;  msgBar =  QgsUtils.iface.messageBar()&#xa;  title = &quot;Action {}&quot;.format( nameAction )&#xa;  msgBar.pushCritical( title,  r['message'] )&#xa;" icon="" notificationMessage="" id="{daa45044-f145-4251-b061-79b40a42ec82}" type="1">
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting name="Zero Transparency" capture="0" isEnabledOnlyWhenEditable="0" shortTitle="Zero Transparency" action="from qgis import utils as QgsUtils&#xa;from ibamaprocessing.algorithms.footprint_algorithm import StyleOutputFootPrint&#xa;&#xa;nameAction = 'setZeroTransparency'&#xa;params = {&#xa;    'layer_id': '[% @layer_id %]'&#xa;}&#xa;r = StyleOutputFootPrint.actions( nameAction, params )&#xa;if not r['isOk']:&#xa;  msgBar =  QgsUtils.iface.messageBar()&#xa;  title = &quot;Action {}&quot;.format( nameAction )&#xa;  msgBar.pushCritical( title,  r['message'] )&#xa;" icon="" notificationMessage="" id="{148a165b-d493-492f-afb6-45d6c823d36c}" type="1">
      <actionScope id="Layer"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="">
    <columns>
      <column name="name" hidden="0" width="-1" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
      <column name="pathfile" hidden="0" width="-1" type="field"/>
      <column name="metadata" hidden="0" width="-1" type="field"/>
      <column name="metadata_html" hidden="0" width="-1" type="field"/>
      <column name="metadata_size" hidden="0" width="-1" type="field"/>
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
