<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE TS>
<TS version="2.1" language="pt_BR">
<context>
    <name>Footprint</name>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="284"/>
        <source>Error for geometry transform {}-&gt;{}</source>
        <translation>Erro na transformação geométrica {}-&gt;{}</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="303"/>
        <source>User not define a CRS for Area</source>
        <translation>Usuário não definiu um SCR para Área</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="346"/>
        <source>Error create Raster memory</source>
        <translation>Erro criando uma Imagem em memória</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="375"/>
        <source>Error create Polygon layer memory</source>
        <translation>Erro criando uma camada de Polígono em memória</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="493"/>
        <source>Canceled by user</source>
        <translation>Cancelado pelo usuário</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="496"/>
        <source>Total error for calculate area: {}. Expression for the filter:
{}</source>
        <translation>Total de erros no cálculo de área: {}. Expressão para o filtro: {}</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="501"/>
        <source>Total None CRS area: {}. Expression for the filter:
{}</source>
        <translation>Total de SCR da área não definido: {}. Expressão para o filtro: {}</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="506"/>
        <source>Total error for calculate geometry: {}. Expression for the filter:
{}</source>
        <translation>Total de erros no cálculo de geometria: {}. Expressão para o filtro: {}</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="537"/>
        <source>Create footprint of images</source>
        <translation>Cria footprint de imagens</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="546"/>
        <source>IBAMA,image,raster,catalog</source>
        <translation>IBAMA,imagem, raster, catálogo</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="577"/>
        <source>Directory {} not exists</source>
        <translation>Diretório {] não existe</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="583"/>
        <source>CRS of area &apos;{}&apos; is not projected</source>
        <translation>SCR da área &apos;{}&apos; não é projetado</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="590"/>
        <source>Directory of input images</source>
        <translation>Diretório de entrada de imagens</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="596"/>
        <source>Search in subdirectories</source>
        <translation>Pesquisar dentro de subdiretórios</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="602"/>
        <source>Filters for search(separate by &apos;;&apos;)</source>
        <translation>Filtro de pesquisa(separado por &apos;;&apos;)</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="608"/>
        <source>Reverse of filters</source>
        <translation>Reverso do filtro</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="614"/>
        <source>CRS for calculate area(if CRS of image is not projected)</source>
        <translation>SCR para calcular area(se o CRS de imagem não é projetado)</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="620"/>
        <source>Type of calculus of Footprint polygons</source>
        <translation>Tipo de cálculo do polígono de footprint</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="626"/>
        <source>Value of NODATA(use by Valid pixels)</source>
        <translation>Valor de NODATA(utilizado pelo pixeis Válidos)</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="632"/>
        <source>CRS of Footprint layer</source>
        <translation>SCR da camada de Footprint</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="638"/>
        <source>Footprint layer</source>
        <translation>Camada de Footprint</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="660"/>
        <source>1/2 Searching images...</source>
        <translation>1/2 Pesquisando imagens...</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="667"/>
        <source>Missing images: {}!</source>
        <translation>Faltando imagens: {}!</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="672"/>
        <source>2/2 Adding features({})...</source>
        <translation>2/2 Adicionando feições({})...</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="525"/>
        <source>Bounding Box(quickly)</source>
        <translation>Retângulo Envolvente(rápido)</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="526"/>
        <source>Valid pixels(slower)</source>
        <translation>Pixeis válidos(lento)</translation>
    </message>
    <message>
        <location filename="../algorithms/footprint_algorithm.py" line="549"/>
        <source>Calculate the footprints of georeferenced images.

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
          . Bounding Box: Area is calculate with this geometry.
          . Valid pixels: Area is calculate with the image limit.
                          After calculus of area, the geometry is simplified.
        - Value of NODATA: Use this value for the areas where not have value.
        - Select the CRS for the footprint layer.
        - Select the source for the output of footprint layer.</source>
        <translation>Cálculo the footprint de imagens georeferenciadas.

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
          . Retângulo envolvente: Área é calculada com essa geometria.
          . Pixeis válidos: Área é calculada com limite válido da imagem(sem NODATA).
                          Após o cálculo da área, a geometria é simplificada.
        - Valor de NODATA: Utilizado este valor para as áreas onde não tem valor.
        - Selecione o CRS para a camada de footprint.
        - Selecione a fonte para a saída da camada de footprint.</translation>
    </message>
</context>
</TS>
