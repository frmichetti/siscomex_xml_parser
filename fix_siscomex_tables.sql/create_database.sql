--
-- PostgreSQL DDL generated from .\ListaDeclaracoesOrdenado.xsd using xsd2pgschema
--  xsd2pgschema - Database replication tool based on XML Schema
--  https://sourceforge.net/projects/xsd2pgschema/
--
-- Schema modeling options:
--  explicit named schema: false
--  relational extension: true
--  wild card extension: true
--  case sensitive name: false
--  no name collision: true
--  append document key: true
--  append serial key: false
--  append xpath key: false
--  retain constraint of primary/foreign key: true
--  retrieve field annotation: false
--  assumed hash algorithm: SHA-1
--  hash key type: unsigned long 64 bits
--
-- Statistics of schema:
--  Generated 9 tables (262 fields), 0 attr groups, 0 model groups in total
--   Namespaces:
--    http://www.w3.org/2001/XMLSchema (xs)
--   Schema locations:
--    .\ListaDeclaracoesOrdenado.xsd
--   Table types:
--    1 root, 8 root children, 0 admin roots, 0 admin children
--   System keys:
--    9 primary keys (0 unique constraints), 8 foreign keys (0 key references), 8 nested keys (0 as attribute)
--   User keys:
--    9 document keys, 0 serial keys, 0 xpath keys
--   Contents:
--    0 attributes (0 in-place document keys), 228 elements (0 in-place document keys), 0 simple contents (0 as attribute, 0 as conditional attribute)
--   Wild cards:
--    0 any elements, 0 any attributes
--

DROP TABLE IF EXISTS mercadoria CASCADE;
DROP TABLE IF EXISTS destaquencm CASCADE;
DROP TABLE IF EXISTS documentoinstrucaodespacho CASCADE;
DROP TABLE IF EXISTS embalagem CASCADE;
DROP TABLE IF EXISTS icms CASCADE;
DROP TABLE IF EXISTS pagamento CASCADE;
DROP TABLE IF EXISTS adicao CASCADE;
DROP TABLE IF EXISTS declaracaoimportacao CASCADE;
DROP TABLE IF EXISTS listadeclaracoes CASCADE;

--
-- No annotation is available
-- canonical name: ListaDeclaracoes
-- xmlns: no namespace, schema location: .\ListaDeclaracoesOrdenado.xsd
-- type: root, content: false, list: true, bridge: true, virtual: false
--
CREATE TABLE listadeclaracoes (
-- DOCUMENT KEY is pointer to data source (aka. Entry ID)
	document_id TEXT ,
	listadeclaracoes_id BIGINT CHECK ( listadeclaracoes_id >= 0 ) ,
-- NESTED KEY : declaracaoimportacao ( declaracaoimportacao_id )
	declaracaoimportacao_id BIGINT CHECK ( declaracaoimportacao_id >= 0 )
);

--
-- No annotation is available
-- canonical name: declaracaoImportacao
-- xmlns: no namespace, schema location: .\ListaDeclaracoesOrdenado.xsd
-- type: root child, content: true, list: true, bridge: false, virtual: false
--
CREATE TABLE declaracaoimportacao (
-- DOCUMENT KEY is pointer to data source (aka. Entry ID)
	document_id TEXT ,
	declaracaoimportacao_id BIGINT CHECK ( declaracaoimportacao_id >= 0 ) ,
-- FOREIGN KEY : listadeclaracoes ( listadeclaracoes_id )
	listadeclaracoes_id BIGINT CHECK ( listadeclaracoes_id >= 0 ) ,
-- NESTED KEY : adicao ( adicao_id )
	adicao_id BIGINT CHECK ( adicao_id >= 0 ) ,
	armazenamentorecintoaduaneirocodigo INTEGER ,
	armazenamentorecintoaduaneironome TEXT ,
	armazenamentosetor INTEGER ,
	canalselecaoparametrizada INTEGER ,
	caracterizacaooperacaocodigotipo INTEGER ,
	caracterizacaooperacaodescricaotipo TEXT ,
	cargadatachegada INTEGER ,
	carganumeroagente INTEGER ,
	cargapaisprocedenciacodigo INTEGER ,
	cargapaisprocedencianome TEXT ,
	cargapesobruto INTEGER ,
	cargapesoliquido INTEGER ,
	cargaurfentradacodigo INTEGER ,
	cargaurfentradanome TEXT ,
	conhecimentocargaembarquedata INTEGER ,
	conhecimentocargaembarquelocal TEXT ,
	conhecimentocargaid INTEGER ,
	conhecimentocargaidmaster INTEGER ,
	conhecimentocargatipocodigo INTEGER ,
	conhecimentocargatiponome TEXT ,
	conhecimentocargautilizacao INTEGER ,
	conhecimentocargautilizacaonome TEXT ,
	datadesembaraco INTEGER ,
	dataregistro INTEGER ,
	documentochegadacargacodigotipo INTEGER ,
	documentochegadacarganome TEXT ,
	documentochegadacarganumero INTEGER ,
	fretecollect INTEGER ,
	freteemterritorionacional INTEGER ,
	fretemoedanegociadacodigo INTEGER ,
	fretemoedanegociadanome TEXT ,
	freteprepaid INTEGER ,
	fretetotaldolares INTEGER ,
	fretetotalmoeda INTEGER ,
	fretetotalreais INTEGER ,
	importadorcodigotipo INTEGER ,
	importadorcpfrepresentantelegal INTEGER ,
	importadorenderecobairro TEXT ,
	importadorenderecocep INTEGER ,
	importadorenderecocomplemento TEXT ,
	importadorenderecologradouro TEXT ,
	importadorenderecomunicipio TEXT ,
	importadorendereconumero INTEGER ,
	importadorenderecouf TEXT ,
	importadornome TEXT ,
	importadornomerepresentantelegal TEXT ,
	importadornumero INTEGER ,
	importadornumerotelefone TEXT ,
	informacaocomplementar TEXT ,
	localdescargatotaldolares INTEGER ,
	localdescargatotalreais INTEGER ,
	localembarquetotaldolares INTEGER ,
	localembarquetotalreais INTEGER ,
	modalidadedespachocodigo INTEGER ,
	modalidadedespachonome TEXT ,
	numerodi INTEGER ,
	operacaofundap TEXT ,
	seguromoedanegociadacodigo INTEGER ,
	seguromoedanegociadanome TEXT ,
	segurototaldolares INTEGER ,
	segurototalmoedanegociada INTEGER ,
	segurototalreais INTEGER ,
	sequencialretificacao INTEGER ,
	situacaoentregacarga TEXT ,
	tipodeclaracaocodigo INTEGER ,
	tipodeclaracaonome TEXT ,
	totaladicoes INTEGER ,
	urfdespachocodigo INTEGER ,
	urfdespachonome TEXT ,
	valortotalmultaarecolherajustado INTEGER ,
	viatransportecodigo INTEGER ,
	viatransportemultimodal TEXT ,
	viatransportenome TEXT ,
	viatransportenometransportador TEXT ,
	viatransportepaistransportadorcodigo INTEGER ,
	viatransportepaistransportadornome TEXT ,
-- NESTED KEY : documentoinstrucaodespacho ( documentoinstrucaodespacho_id )
	documentoinstrucaodespacho_id BIGINT CHECK ( documentoinstrucaodespacho_id >= 0 ) ,
-- NESTED KEY : embalagem ( embalagem_id )
	embalagem_id BIGINT CHECK ( embalagem_id >= 0 ) ,
-- NESTED KEY : icms ( icms_id )
	icms_id BIGINT CHECK ( icms_id >= 0 ) ,
-- NESTED KEY : pagamento ( pagamento_id )
	pagamento_id BIGINT CHECK ( pagamento_id >= 0 )
);

--
-- No annotation is available
-- xmlns: no namespace, schema location: .\ListaDeclaracoesOrdenado.xsd
-- type: root child, content: true, list: true, bridge: false, virtual: false
--
CREATE TABLE adicao (
-- DOCUMENT KEY is pointer to data source (aka. Entry ID)
	document_id TEXT ,
	adicao_id BIGINT CHECK ( adicao_id >= 0 ) ,
-- FOREIGN KEY : declaracaoimportacao ( declaracaoimportacao_id )
	declaracaoimportacao_id BIGINT CHECK ( declaracaoimportacao_id >= 0 ) ,
	cidevaloraliquotaespecifica INTEGER ,
	cidevalordevido INTEGER ,
	cidevalorrecolher INTEGER ,
	codigorelacaocompradorvendedor INTEGER ,
	codigovinculocompradorvendedor INTEGER ,
	cofinsaliquotaadvalorem INTEGER ,
	cofinsaliquotaespecificaquantidadeunidade INTEGER ,
	cofinsaliquotaespecificavalor INTEGER ,
	cofinsaliquotareduzida INTEGER ,
	cofinsaliquotavalordevido INTEGER ,
	cofinsaliquotavalorrecolher INTEGER ,
	condicaovendaincoterm TEXT ,
	condicaovendalocal TEXT ,
	condicaovendametodovaloracaocodigo INTEGER ,
	condicaovendametodovaloracaonome TEXT ,
	condicaovendamoedacodigo INTEGER ,
	condicaovendamoedanome TEXT ,
	condicaovendavalormoeda INTEGER ,
	condicaovendavalorreais INTEGER ,
	dadoscambiaiscoberturacambialcodigo INTEGER ,
	dadoscambiaiscoberturacambialnome TEXT ,
	dadoscambiaisinstituicaofinanciadoracodigo INTEGER ,
	dadoscambiaisinstituicaofinanciadoranome TEXT ,
	dadoscambiaismotivosemcoberturacodigo INTEGER ,
	dadoscambiaismotivosemcoberturanome TEXT ,
	dadoscambiaisvalorrealcambio INTEGER ,
	dadoscargapaisprocedenciacodigo INTEGER ,
	dadoscargaurfentradacodigo INTEGER ,
	dadoscargaviatransportecodigo INTEGER ,
	dadosmercadoriaaplicacao TEXT ,
	dadosmercadoriacodigonaladincca INTEGER ,
	dadosmercadoriacodigonaladish INTEGER ,
	dadosmercadoriacodigoncm INTEGER ,
	dadosmercadoriacondicao TEXT ,
	dadosmercadoriamedidaestatisticaquantidade INTEGER ,
	dadosmercadoriamedidaestatisticaunidade TEXT ,
	dadosmercadorianomencm TEXT ,
	dadosmercadoriapesoliquido INTEGER ,
	dcrcoeficientereducao INTEGER ,
	dcridentificacao INTEGER ,
	dcrvalordevido INTEGER ,
	dcrvalordolar INTEGER ,
	dcrvalorreal INTEGER ,
	dcrvalorrecolher INTEGER ,
	fabricantecidade TEXT ,
	fabricantecomplemento TEXT ,
	fabricanteestado TEXT ,
	fabricantelogradouro TEXT ,
	fabricantenome TEXT ,
	fabricantenumero INTEGER ,
	fornecedorcidade TEXT ,
	fornecedorcomplemento TEXT ,
	fornecedorlogradouro TEXT ,
	fornecedornome TEXT ,
	fornecedornumero INTEGER ,
	fretemoedanegociadacodigo INTEGER ,
	fretevalormoedanegociada INTEGER ,
	fretevalorreais INTEGER ,
	iiacordotarifariotipocodigo INTEGER ,
	iialiquotaacordo INTEGER ,
	iialiquotaadvalorem INTEGER ,
	iialiquotapercentualreducao INTEGER ,
	iialiquotareduzida INTEGER ,
	iialiquotavalorcalculado INTEGER ,
	iialiquotavalordevido INTEGER ,
	iialiquotavalorrecolher INTEGER ,
	iialiquotavalorreduzido INTEGER ,
	iibasecalculo INTEGER ,
	iiextarifarioatolegalano INTEGER ,
	iiextarifarioatolegalcodigo TEXT ,
	iiextarifarioatolegalex INTEGER ,
	iiextarifarioatolegalnumero INTEGER ,
	iiextarifarioatolegalorgaoemissor TEXT ,
	iifundamentolegalcodigo INTEGER ,
	iimotivoadmissaotemporariacodigo INTEGER ,
	iiregimetributacaocodigo INTEGER ,
	iiregimetributacaonome TEXT ,
	ipialiquotaadvalorem INTEGER ,
	ipialiquotaespecificacapacidaderecipciente INTEGER ,
	ipialiquotaespecificaquantidadeunidademedida INTEGER ,
	ipialiquotaespecificatiporecipientecodigo INTEGER ,
	ipialiquotaespecificavalorunidademedida INTEGER ,
	ipialiquotanotacomplementartipi INTEGER ,
	ipialiquotareduzida INTEGER ,
	ipialiquotavalordevido INTEGER ,
	ipialiquotavalorrecolher INTEGER ,
	ipiregimetributacaocodigo INTEGER ,
	ipiregimetributacaonome TEXT ,
	numeroadicao INTEGER ,
	numerodi INTEGER ,
	numeroli INTEGER ,
	paisaquisicaomercadoriacodigo INTEGER ,
	paisaquisicaomercadorianome TEXT ,
	paisorigemmercadoriacodigo INTEGER ,
	paisorigemmercadorianome TEXT ,
	piscofinsbasecalculoaliquotaicms INTEGER ,
	piscofinsbasecalculofundamentolegalcodigo INTEGER ,
	piscofinsbasecalculopercentualreducao INTEGER ,
	piscofinsbasecalculovalor INTEGER ,
	piscofinsfundamentolegalreducaocodigo INTEGER ,
	piscofinsregimetributacaocodigo INTEGER ,
	piscofinsregimetributacaonome TEXT ,
	pispasepaliquotaadvalorem INTEGER ,
	pispasepaliquotaespecificaquantidadeunidade INTEGER ,
	pispasepaliquotaespecificavalor INTEGER ,
	pispasepaliquotareduzida INTEGER ,
	pispasepaliquotavalordevido INTEGER ,
	pispasepaliquotavalorrecolher INTEGER ,
	relacaocompradorvendedor TEXT ,
	seguromoedanegociadacodigo INTEGER ,
	segurovalormoedanegociada INTEGER ,
	segurovalorreais INTEGER ,
	sequencialretificacao INTEGER ,
	valormultaarecolher INTEGER ,
	valormultaarecolherajustado INTEGER ,
	valorreaisfreteinternacional INTEGER ,
	valorreaissegurointernacional INTEGER ,
	valortotalcondicaovenda INTEGER ,
	vinculocompradorvendedor TEXT ,
-- NESTED KEY : mercadoria ( mercadoria_id )
	mercadoria_id BIGINT CHECK ( mercadoria_id >= 0 ) ,
-- NESTED KEY : destaquencm ( destaquencm_id )
	destaquencm_id BIGINT CHECK ( destaquencm_id >= 0 )
);

--
-- No annotation is available
-- xmlns: no namespace, schema location: .\ListaDeclaracoesOrdenado.xsd
-- type: root child, content: true, list: false, bridge: false, virtual: false
--
CREATE TABLE mercadoria (
-- DOCUMENT KEY is pointer to data source (aka. Entry ID)
	document_id TEXT ,
	mercadoria_id BIGINT CHECK ( mercadoria_id >= 0 ) ,
-- FOREIGN KEY : adicao ( adicao_id )
	adicao_id BIGINT CHECK ( adicao_id >= 0 ) ,
	descricaomercadoria TEXT ,
	numerosequencialitem INTEGER ,
	quantidade INTEGER ,
	unidademedida TEXT ,
	valorunitario INTEGER
);

--
-- No annotation is available
-- canonical name: destaqueNcm
-- xmlns: no namespace, schema location: .\ListaDeclaracoesOrdenado.xsd
-- type: root child, content: true, list: false, bridge: false, virtual: false
--
CREATE TABLE destaquencm (
-- DOCUMENT KEY is pointer to data source (aka. Entry ID)
	document_id TEXT ,
	destaquencm_id BIGINT CHECK ( destaquencm_id >= 0 ) ,
-- FOREIGN KEY : adicao ( adicao_id )
	adicao_id BIGINT CHECK ( adicao_id >= 0 ) ,
	numerodestaque INTEGER
);

--
-- No annotation is available
-- canonical name: documentoInstrucaoDespacho
-- xmlns: no namespace, schema location: .\ListaDeclaracoesOrdenado.xsd
-- type: root child, content: true, list: false, bridge: false, virtual: false
--
CREATE TABLE documentoinstrucaodespacho (
-- DOCUMENT KEY is pointer to data source (aka. Entry ID)
	document_id TEXT ,
	documentoinstrucaodespacho_id BIGINT CHECK ( documentoinstrucaodespacho_id >= 0 ) ,
-- FOREIGN KEY : declaracaoimportacao ( declaracaoimportacao_id )
	declaracaoimportacao_id BIGINT CHECK ( declaracaoimportacao_id >= 0 ) ,
	codigotipodocumentodespacho INTEGER ,
	nomedocumentodespacho TEXT ,
	numerodocumentodespacho TEXT
);

--
-- No annotation is available
-- xmlns: no namespace, schema location: .\ListaDeclaracoesOrdenado.xsd
-- type: root child, content: true, list: false, bridge: false, virtual: false
--
CREATE TABLE embalagem (
-- DOCUMENT KEY is pointer to data source (aka. Entry ID)
	document_id TEXT ,
	embalagem_id BIGINT CHECK ( embalagem_id >= 0 ) ,
-- FOREIGN KEY : declaracaoimportacao ( declaracaoimportacao_id )
	declaracaoimportacao_id BIGINT CHECK ( declaracaoimportacao_id >= 0 ) ,
	codigotipoembalagem INTEGER ,
	nomeembalagem TEXT ,
	quantidadevolume INTEGER
);

--
-- No annotation is available
-- xmlns: no namespace, schema location: .\ListaDeclaracoesOrdenado.xsd
-- type: root child, content: true, list: false, bridge: false, virtual: false
--
CREATE TABLE icms (
-- DOCUMENT KEY is pointer to data source (aka. Entry ID)
	document_id TEXT ,
	icms_id BIGINT CHECK ( icms_id >= 0 ) ,
-- FOREIGN KEY : declaracaoimportacao ( declaracaoimportacao_id )
	declaracaoimportacao_id BIGINT CHECK ( declaracaoimportacao_id >= 0 ) ,
	agenciaicms INTEGER ,
	bancoicms INTEGER ,
	codigotiporecolhimentoicms INTEGER ,
	cpfresponsavelregistro INTEGER ,
	dataregistro INTEGER ,
	horaregistro INTEGER ,
	nometiporecolhimentoicms TEXT ,
	numerosequencialicms INTEGER ,
	uficms TEXT ,
	valortotalicms INTEGER
);

--
-- No annotation is available
-- xmlns: no namespace, schema location: .\ListaDeclaracoesOrdenado.xsd
-- type: root child, content: true, list: false, bridge: false, virtual: false
--
CREATE TABLE pagamento (
-- DOCUMENT KEY is pointer to data source (aka. Entry ID)
	document_id TEXT ,
	pagamento_id BIGINT CHECK ( pagamento_id >= 0 ) ,
-- FOREIGN KEY : declaracaoimportacao ( declaracaoimportacao_id )
	declaracaoimportacao_id BIGINT CHECK ( declaracaoimportacao_id >= 0 ) ,
	agenciapagamento INTEGER ,
	bancopagamento INTEGER ,
	codigoreceita INTEGER ,
	codigotipopagamento INTEGER ,
	contapagamento INTEGER ,
	datapagamento INTEGER ,
	nometipopagamento TEXT ,
	numeroretificacao INTEGER ,
	valorjurosencargos INTEGER ,
	valormulta INTEGER ,
	valorreceita INTEGER
);

