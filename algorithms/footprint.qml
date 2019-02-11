<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyDrawingTol="1" minScale="1e+8" hasScaleBasedVisibilityFlag="0" simplifyDrawingHints="1" version="3.4.4-Madeira" simplifyAlgorithm="0" maxScale="-4.65661e-10" styleCategories="AllStyleCategories" simplifyMaxScale="1" simplifyLocal="1" readOnly="0" labelsEnabled="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 forceraster="0" symbollevels="0" enableorderby="0" type="singleSymbol">
    <symbols>
      <symbol clip_to_extent="1" alpha="0.419608" name="0" force_rhr="0" type="fill">
        <layer pass="0" enabled="1" class="SimpleFill" locked="0">
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
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
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory minimumSize="0" maxScaleDenominator="1e+8" backgroundColor="#ffffff" penColor="#000000" lineSizeScale="3x:0,0,0,0,0,0" enabled="0" barWidth="5" scaleBasedVisibility="0" sizeScale="3x:0,0,0,0,0,0" rotationOffset="270" penAlpha="255" height="15" lineSizeType="MM" labelPlacementMethod="XHeight" minScaleDenominator="-4.65661e-10" sizeType="MM" penWidth="0" backgroundAlpha="255" diagramOrientation="Up" scaleDependency="Area" opacity="1" width="15">
      <fontProperties style="Regular" description="Noto Sans,10,-1,0,50,0,0,0,0,0,Regular"/>
      <attribute field="" label="" color="#000000"/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings showAll="1" zIndex="0" placement="1" dist="0" linePlacementFlags="18" priority="0" obstacle="0">
    <properties>
      <Option type="Map">
        <Option value="" name="name" type="QString"/>
        <Option name="properties"/>
        <Option value="collection" name="type" type="QString"/>
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
            <Option value="true" name="IsMultiline" type="bool"/>
            <Option value="true" name="UseHtml" type="bool"/>
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
    <alias field="name" index="0" name=""/>
    <alias field="pathfile" index="1" name=""/>
    <alias field="metadata" index="2" name=""/>
    <alias field="metadata_html" index="3" name=""/>
    <alias field="metadata_size" index="4" name=""/>
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
    <constraint field="name" unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="pathfile" unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="metadata" unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="metadata_html" unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="metadata_size" unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0"/>
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
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
    <actionsetting shortTitle="" notificationMessage="" action="from qgis import utils as QgsUtils&#xa;from ibamaprocessing.algorithms.footprint_algorithm import StyleOutputFootPrint&#xa;&#xa;nameAction = 'zoom'&#xa;r = StyleOutputFootPrint.actions( nameAction, '[% @layer_id %]', [% $id %] )&#xa;if not r['isOk']:&#xa;  msgBar =  QgsUtils.iface.messageBar()&#xa;  title = &quot;Action {}&quot;.format( nameAction )&#xa;  msgBar.pushCritical( title,  r['message'] )&#xa;" icon="" isEnabledOnlyWhenEditable="0" capture="0" id="{8bb219ee-293d-4aa5-a639-d77f625c1d0e}" name="Zoom Image" type="1">
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting shortTitle="" notificationMessage="" action="from qgis import utils as QgsUtils&#xa;from ibamaprocessing.algorithms.footprint_algorithm import StyleOutputFootPrint&#xa;&#xa;nameAction = 'highlight'&#xa;r = StyleOutputFootPrint.actions( nameAction, '[% @layer_id %]', [% $id %] )&#xa;if not r['isOk']:&#xa;  msgBar =  QgsUtils.iface.messageBar()&#xa;  title = &quot;Action {}&quot;.format( nameAction )&#xa;  msgBar.pushCritical( title,  r['message'] )&#xa;" icon="" isEnabledOnlyWhenEditable="0" capture="0" id="{0240de0f-1cac-43f4-a713-ba0810aa83a5}" name="Highlight Image" type="1">
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting shortTitle="" notificationMessage="" action="from qgis import utils as QgsUtils&#xa;from ibamaprocessing.algorithms.footprint_algorithm import StyleOutputFootPrint&#xa;&#xa;nameAction = 'show_hideImage'&#xa;r = StyleOutputFootPrint.actions( nameAction, '[% @layer_id %]', [% $id %] )&#xa;if not r['isOk']:&#xa;  msgBar =  QgsUtils.iface.messageBar()&#xa;  title = &quot;Action {}&quot;.format( nameAction )&#xa;  msgBar.pushCritical( title,  r['message'] )&#xa;" icon="" isEnabledOnlyWhenEditable="0" capture="0" id="{8134e5f5-bbed-4242-986c-434b55313d89}" name="Show/Hide Image" type="1">
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting shortTitle="" notificationMessage="" action="from qgis import utils as QgsUtils&#xa;from ibamaprocessing.algorithms.footprint_algorithm import StyleOutputFootPrint&#xa;&#xa;nameAction = 'setCurrent'&#xa;r = StyleOutputFootPrint.actions( nameAction, '[% @layer_id %]', [% $id %] )&#xa;if not r['isOk']:&#xa;  msgBar =  QgsUtils.iface.messageBar()&#xa;  title = &quot;Action {}&quot;.format( nameAction )&#xa;  msgBar.pushCritical( title,  r['message'] )&#xa;" icon="" isEnabledOnlyWhenEditable="0" capture="0" id="{00c89fc6-2945-4238-92ba-300406a9b413}" name="Set Current Image" type="1">
      <actionScope id="Feature"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="">
    <columns>
      <column hidden="0" width="-1" name="name" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
      <column hidden="0" width="-1" name="pathfile" type="field"/>
      <column hidden="0" width="-1" name="metadata" type="field"/>
      <column hidden="0" width="-1" name="metadata_html" type="field"/>
      <column hidden="0" width="-1" name="metadata_size" type="field"/>
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
    <field labelOnTop="0" name="filename"/>
    <field labelOnTop="0" name="meta_html"/>
    <field labelOnTop="0" name="meta_jsize"/>
    <field labelOnTop="0" name="meta_json"/>
    <field labelOnTop="0" name="metadata"/>
    <field labelOnTop="1" name="metadata_html"/>
    <field labelOnTop="0" name="metadata_size"/>
    <field labelOnTop="0" name="name"/>
    <field labelOnTop="0" name="pathfile"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>name</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
