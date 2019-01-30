<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE TS><TS version="2.0" language="pt_BR" sourcelanguage="">
<context>
    <name>Footprint</name>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="189"/>
        <source>Error for geometry transform {}-&gt;{}</source>
        <translation>Erro na transformação geométrica {}-&gt;{}</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="208"/>
        <source>User not define a CRS for Area</source>
        <translation>Usuário não definiu um CRS para Área</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="251"/>
        <source>Error create Raster memory</source>
        <translation>Erro criando uma Imagem em memória</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="280"/>
        <source>Error create Polygon layer memory</source>
        <translation>Erro criando uma camada de Polígono em memória</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="394"/>
        <source>Canceled by user</source>
        <translation>Cancelado pelo usuário</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="397"/>
        <source>Total error for calculate area: {}. Expression for the filter:
{}</source>
        <translation>Total de erros no cálculo de área: {}. Expressão para o filtro: {}</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="402"/>
        <source>Total None CRS area: {}. Expression for the filter:
{}</source>
        <translation>Total de CRS da área não definido: {}. Expressão para o filtro: {}</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="407"/>
        <source>Total error for calculate geometry: {}. Expression for the filter:
{}</source>
        <translation>Total de erros no cálculo de geometria: {}. Expressão para o filtro: {}</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="438"/>
        <source>Create footprint of images</source>
        <translation>Cria footprint de imagens</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="447"/>
        <source>IBAMA,image,raster,catalog</source>
        <translation>IBAMA,imagem, raster, catálogo</translation>
    </message>
    <message>
        <location filename="../footprint_algorithm.py" line="466"/>
        <source>
        Calculate the footprints of georeferenced images.

        Usage:
        - Choice the directory of input images
        - Mark subdirectories for do recursive search of images
        - Add filter in search of images.
          Use &apos;;&apos; to separate the words.
          Ex.: filter1;filter2;filter3
          If the word is contain inside the name of file, this image is selected
        - Use the reverse of the filter to capture the opposite of the filters
        - Select the CRS for the calculate of area.
          This CRS will be use if image not have the projected CRS
        - Select the type of calculus of Footprint polygons:
          . Bounding Box
          . Valid pixels: Calculates the image limit
        - Value of NODATA: Use this value for the areas where not have value.
        - Select the CRS for the footprint layer
        - Select the source for the output of footprint layer
        </source>
        <translation type="obsolete">
        Cálculo the footprint de imagens georeferenciadas.

        Uso:
        - Escolha o diretório de imagens de entrada.
        - Marque subdiretórios para fazer a pesquisa recursiva de imagens.
        - Adicione filtro dentro da pesquisa de imagens.
          Use &apos;;&apos; para separar as palavras.
          Ex.: filtro1;filtro2;filtro3.
          Se a palavrá está dentro do nome do arquivo, essa imagem é selecionada.
        - Use o reverso do filtro para obter o oposto dos filtros.
        - Selecione o CRS para o cáculo de área.
          Este CRS será utilizado se a imagem não tiver um CRS projetado.
        - Selecione o tipo de cálculo dos polígonos de Footprint:
          . Caixa de envolvimento.
          . Pixeis válidos: Calcula o limite da imagem.
        - Valor de NODATA: Utilizado este valor para as áreas onde não tem valor.
        - Selecione o CRS para a camada de footprint.
        - Selecione a fonte para a saída da camada de footprint.
        </translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="479"/>
        <source>Directory {} not exists</source>
        <translation>Diretório {] não existe</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="485"/>
        <source>CRS of area &apos;{}&apos; is not projected</source>
        <translation>CRS da área &apos;{}&apos; não é projetado</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="492"/>
        <source>Directory of input images</source>
        <translation>Diretório de entrada de imagens</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="498"/>
        <source>Search in subdirectories</source>
        <translation>Pesquisar dentro de subdiretórios</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="504"/>
        <source>Filters for search(separate by &apos;;&apos;)</source>
        <translation>Filtro de pesquisa(separado por &apos;;&apos;)</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="510"/>
        <source>Reverse of filters</source>
        <translation>Reverso do filtro</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="516"/>
        <source>CRS for calculate area(if CRS of image is not projected)</source>
        <translation>CRS para calcular area(se o CRS de imagem não é projetado)</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="522"/>
        <source>Type of calculus of Footprint polygons</source>
        <translation>Tipo de cálculo do polígono de footprint</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="528"/>
        <source>Value of NODATA(use by Valid pixels)</source>
        <translation>Valor de NODATA(utilizado pelo pixeis Válidos)</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="534"/>
        <source>CRS of Footprint layer</source>
        <translation>CRS da camada de Footprint</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="540"/>
        <source>Footprint layer</source>
        <translation>Camada de Footprint</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="564"/>
        <source>1/2 Searching images...</source>
        <translation>1/2 Pesquisando imagens...</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="571"/>
        <source>Missing images: {}!</source>
        <translation>Faltando imagens: {}!</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="576"/>
        <source>2/2 Adding features({})...</source>
        <translation>2/2 Adicionando feições({})...</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="426"/>
        <source>Bounding Box(quickly)</source>
        <translation>Caixa de envolvimento(rápido)</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="427"/>
        <source>Valid pixels(slower)</source>
        <translation>Pixeis válidos(lento)</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="450"/>
        <source>
        Calculate the footprints of georeferenced images.

        Usage:
        - Choice the directory of input images.
        - Mark subdirectories for do recursive search of images.
        - Add filter in search of images.
          Use &apos;;&apos; to separate the words.
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
        </source>
        <translation>
        Cálculo the footprint de imagens georefrenciadas.

        Uso:
        - Escolha o diretório de imagens de entrada.
        - Marque subdiretórios para fazer a pesquisa recursiva de imagens.
        - Adicione filtro dentro da pesquisa de imagens.
          Use &apos;;&apos; para separar as palavras.
          Ex.: filtro1;filtro2;filtro3.
          Se a palavrá está dentro do nome do arquivo, essa imagem é selecionada.
        - Use o reverso do filtro para obter o oposto dos filtros.
        - Selecione o CRS para o cáculo de área.
          Este CRS será utilizado se a imagem não tiver um CRS projetado.
        - Selecione o tipo de cálculo dos polígonos de Footprint:
          . Caixa de envolvimento.
          . Pixeis válidos: Calcula o limite da imagem.
        - Valor de NODATA: Utilizado este valor para as áreas onde não tem valor.
        - Selecione o CRS para a camada de footprint.
        - Selecione a fonte para a saída da camada de footprint.
        </translation>
    </message>
</context>
</TS>
