create schema public;

comment on schema public is 'standard public schema';

create table lista_declaracoes(
	document_id varchar(255),
	id bigserial not null
		constraint lista_declaracoes_pk
			primary key,
	declaracao_importacao_id varchar(255)
);

create unique index lista_declaracoes_id_uindex	on lista_declaracoes (id);

create table declaracao_importacao(
	document_id varchar(255),
	id bigserial not null
		constraint declaracao_importacao_pk
			primary key,
	lista_declaracoes_id varchar(255),
	adicao_id varchar(255),
	armazenamento_recinto_aduaneiro_codigo varchar(255),
	armazenamento_recinto_aduaneiro_nome varchar(255),
	armazenamento_setor varchar(255),
	canal_selecao_parametrizada varchar(255),
	caracterizacao_operacao_codigo_tipo varchar(255),
	caracterizacao_operacao_descricao_tipo varchar(255),
	carga_data_chegada varchar(255),
	carga_numero_agente varchar(255),
	carga_pais_procedencia_codigo varchar(255),
	carga_pais_procedencia_nome varchar(255),
	carga_peso_bruto varchar(255),
	carga_peso_liquido varchar(255),
	carga_urf_entrada_codigo varchar(255),
	carga_urf_entrada_nome varchar(255),
	conhecimento_carga_embarque_data varchar(255),
	conhecimento_carga_embarque_local varchar(255),
	conhecimento_carga_id varchar(255),
	conhecimento_carga_id_master varchar(255),
	conhecimento_carga_tipo_codigo varchar(255),
	conhecimento_carga_tipo_nome varchar(255),
	conhecimento_carga_utilizacao varchar(255),
	conhecimento_carga_utilizacao_nome varchar(255),
	data_desembaraco varchar(255),
	data_registro varchar(255),
	documento_chegada_carga_codigo_tipo varchar(255),
	documento_chegada_carga_nome varchar(255),
	documento_chegada_carga_numero varchar(255),
	frete_collect varchar(255),
	frete_em_territorio_nacional varchar(255),
	frete_moeda_negociada_codigo varchar(255),
	frete_moeda_negociada_nome varchar(255),
	frete_prepaid varchar(255),
	frete_total_dolares varchar(255),
	frete_total_moeda varchar(255),
	frete_total_reais varchar(255),
	importador_codigo_tipo varchar(255),
	importador_cpf_representante_legal varchar(255),
	importador_endereco_bairro varchar(255),
	importador_endereco_cep varchar(255),
	importador_endereco_complemento varchar(255),
	importador_endereco_logradouro varchar(255),
	importador_endereco_municipio varchar(255),
	importador_endereco_numero varchar(255),
	importador_endereco_uf varchar(255),
	importador_nome varchar(255),
	importador_nome_representante_legal varchar(255),
	importador_numero varchar(255),
	importador_numero_telefone varchar(255),
	informacao_complementar varchar(255),
	local_descarga_total_dolares varchar(255),
	local_descarga_total_reais varchar(255),
	local_embarque_total_dolares varchar(255),
	local_embarque_total_reais varchar(255),
	modalidade_despacho_codigo varchar(255),
	modalidade_despacho_nome varchar(255),
	numero_di varchar(255),
	operacao_fundap varchar(255),
	seguro_moeda_negociada_codigo varchar(255),
	seguro_moeda_negociada_nome varchar(255),
	seguro_total_dolares varchar(255),
	seguro_total_moeda_negociada varchar(255),
	seguro_total_reais varchar(255),
	sequencial_retificacao varchar(255),
	situacao_entrega_carga varchar(255),
	tipo_declaracao_codigo varchar(255),
	tipo_declaracao_nome varchar(255),
	total_adicoes varchar(255),
	urf_despacho_codigo varchar(255),
	urf_despacho_nome varchar(255),
	valor_total_multa_a_recolher_ajustado varchar(255),
	via_transporte_codigo varchar(255),
	via_transporte_multimodal varchar(255),
	via_transporte_nome varchar(255),
	via_transporte_nome_transportador varchar(255),
	via_transporte_pais_transportador_codigo varchar(255),
	via_transporte_pais_transportador_nome varchar(255),
	documento_instrucao_despacho_id varchar(255),
	embalagem_id varchar(255),
	icms_id varchar(255),
	pagamento_id varchar(255));

create unique index declaracao_importacao_id_uindex
	on declaracao_importacao (id);

create table adicao(
	document_id varchar(255),
	id bigserial not null
		constraint adicao_pk
			primary key,
	declaracao_importacao_id varchar(255),
	cide_valor_aliquota_especifica varchar(255),
	cidevalordevido varchar(255),
	cide_valor_recolher varchar(255),
	codigo_relacao_comprador_vendedor varchar(255),
	codigo_vinculo_comprador_vendedor varchar(255),
	cofins_aliquota_advalorem varchar(255),
	cofins_aliquota_especifica_quantidade_unidade varchar(255),
	cofins_aliquota_especifica_valor varchar(255),
	cofins_aliquota_reduzida varchar(255),
	cofins_aliquota_valor_devido varchar(255),
	cofins_aliquota_valor_recolher varchar(255),
	condicao_venda_incoterm varchar(255),
	condicao_venda_local varchar(255),
	condicao_venda_metodo_valor_acao_codigo varchar(255),
	condicao_venda_metodo_valor_acao_nome varchar(255),
	condicao_venda_moeda_codigo varchar(255),
	condicao_venda_moeda_nome varchar(255),
	condicao_venda_valor_moeda varchar(255),
	condicao_venda_valor_reais varchar(255),
	dados_cambiais_cobertura_cambial_codigo varchar(255),
	dados_cambiais_cobertura_cambial_nome varchar(255),
	dados_cambiais_instituicao_financiadora_codigo varchar(255),
	dados_cambiais_instituicao_financiadora_nome varchar(255),
	dados_cambiais_motivo_sem_cobertura_codigo varchar(255),
	dados_cambiais_motivo_sem_cobertura_nome varchar(255),
	dados_cambiais_valor_real_cambio varchar(255),
	dados_carga_pais_procedencia_codigo varchar(255),
	dados_carga_urf_entrada_codigo varchar(255),
	dados_carga_via_transporte_codigo varchar(255),
	dados_mercadoria_aplicacao varchar(255),
	dados_mercadoria_codigo_naladi_ncca varchar(255),
	dados_mercadoria_codigo_naladish varchar(255),
	dados_mercadoria_codigo_ncm varchar(255),
	dados_mercadoria_condicao varchar(255),
	dados_mercadoria_medida_estatistica_quantidade varchar(255),
	dados_mercadoria_medida_estatistica_unidade varchar(255),
	dados_mercadoria_nome_ncm varchar(255),
	dados_mercadoria_peso_liquido varchar(255),
	dcr_coeficiente_reducao varchar(255),
	dcr_identificacao varchar(255),
	dcr_valor_devido varchar(255),
	dcr_valor_dolar varchar(255),
	dcr_valor_real varchar(255),
	dcr_valor_recolher varchar(255),
	fabricante_cidade varchar(255),
	fabricante_complemento varchar(255),
	fabricante_estado varchar(255),
	fabricante_logradouro varchar(255),
	fabricante_nome varchar(255),
	fabricante_numero varchar(255),
	fornecedor_cidade varchar(255),
	fornecedor_complemento varchar(255),
	fornecedor_logradouro varchar(255),
	fornecedor_nome varchar(255),
	fornecedor_numero varchar(255),
	frete_moeda_negociada_codigo varchar(255),
	frete_valor_moeda_negociada varchar(255),
	frete_valor_reais varchar(255),
	ii_acordo_tarifario_tipo_codigo varchar(255),
	ii_aliquota_acordo varchar(255),
	ii_aliquota_advalorem varchar(255),
	ii_aliquota_percentual_reducao varchar(255),
	ii_aliquota_reduzida varchar(255),
	ii_aliquota_valor_calculado varchar(255),
	ii_aliquota_valor_devido varchar(255),
	ii_aliquota_valor_recolher varchar(255),
	ii_aliquota_valor_reduzido varchar(255),
	ii_base_calculo varchar(255),
	ii_ex_tarifario_ato_legal_ano varchar(255),
	iiextarifarioatolegalcodigo varchar(255),
	ii_ex_tarifario_ato_legal_ex varchar(255),
	ii_ex_tarifario_ato_legal_numero varchar(255),
	ii_ex_tarifario_ato_legal_orgao_emissor varchar(255),
	ii_fundamento_legal_codigo varchar(255),
	ii_motivo_admissao_temporaria_codigo varchar(255),
	ii_regime_tributacao_codigo varchar(255),
	ii_regime_tributacao_nome varchar(255),
	ipi_aliquota_advalorem varchar(255),
	ipi_aliquota_especifica_capacidade_recipciente varchar(255),
	ipi_aliquota_especifica_quantidade_unidade_medida varchar(255),
	ipi_aliquota_especifica_tipo_recipiente_codigo varchar(255),
	ipi_aliquota_especifica_valor_unidade_medida varchar(255),
	ipi_aliquota_nota_complementar_tipi varchar(255),
	ipi_aliquota_reduzida varchar(255),
	ipi_aliquota_valor_devido varchar(255),
	ipi_aliquota_valor_recolher varchar(255),
	ipi_regime_tributacao_codigo varchar(255),
	ipi_regime_tributacao_nome varchar(255),
	numero_adicao varchar(255),
	numero_di varchar(255),
	numero_li varchar(255),
	pais_aquisicao_mercadoria_codigo varchar(255),
	pais_aquisicao_mercadoria_nome varchar(255),
	pais_origem_mercadoria_codigo varchar(255),
	pais_origem_mercadoria_nome varchar(255),
	pis_cofins_base_calculo_aliquota_icms varchar(255),
	pis_cofins_base_calculo_fundamento_legal_codigo varchar(255),
	pis_cofins_base_calculo_percentual_reducao varchar(255),
	pis_cofins_base_calculo_valor varchar(255),
	pis_cofins_fundamento_legal_reducao_codigo varchar(255),
	pis_cofins_regime_tributacao_codigo varchar(255),
	pis_cofins_regime_tributacao_nome varchar(255),
	pis_pasep_aliquota_advalorem varchar(255),
	pis_pasep_aliquota_especifica_quantidade_unidade varchar(255),
	pis_pasep_aliquota_especifica_valor varchar(255),
	pis_pasep_aliquota_reduzida varchar(255),
	pis_pasep_aliquota_valor_devido varchar(255),
	pis_pasep_aliquota_valor_recolher varchar(255),
	relacao_comprador_vendedor varchar(255),
	seguro_moeda_negociada_codigo varchar(255),
	seguro_valor_moeda_negociada varchar(255),
	seguro_valor_reais varchar(255),
	sequencial_retificacao varchar(255),
	valor_multa_a_recolher varchar(255),
	valor_multa_a_recolher_ajustado varchar(255),
	valor_reais_frete_internacional varchar(255),
	valor_reais_seguro_internacional varchar(255),
	valor_total_condicao_venda varchar(255),
	vinculo_comprador_vendedor varchar(255),
	mercadoria_id varchar(255),
	destaque_ncm_id varchar(255)
);

create unique index adicao_id_uindex
	on adicao (id);

create table mercadoria(
	document_id varchar(255),
	id bigserial not null
		constraint mercadoria_pk
			primary key,
	adicao_id varchar(255),
	descricao_mercadoria text,
	numero_sequencial_item varchar(255),
	quantidade varchar(255),
	unidade_medida varchar(255),
	valor_unitario varchar(255)
);

create unique index mercadoria_id_uindex
	on mercadoria (id);

create table destaque_ncm(
	document_id varchar(255),
	id bigserial not null
		constraint destaque_ncm_pk
			primary key,
	adicao_id varchar(255),
	numero_destaque varchar(255)
);

create unique index destaque_ncm_id_uindex
	on destaque_ncm (id);

create table documento_instrucao_despacho(
	document_id varchar(255),
	id bigserial not null
		constraint documento_instrucao_despacho_pk
			primary key,
	declaracao_importacao_id varchar(255),
	codigo_tipo_documento_despacho varchar(255),
	nome_documento_despacho varchar(255),
	numero_documento_despacho varchar(255)
)
;

create unique index documento_instrucao_despacho_id_uindex
	on documento_instrucao_despacho (id);

create table embalagem(
	document_id varchar(255),
	id bigserial not null
		constraint embalagem_pk
			primary key,
	declaracao_importacao_id varchar(255),
	codigo_tipo_embalagem varchar(255),
	nome_embalagem varchar(255),
	quantidade_volume varchar(255)
);

create unique index embalagem_id_uindex
	on embalagem (id);

create table icms(
	document_id serial,
	id bigserial not null
		constraint icms_pk
			primary key,
	declaracao_importacao_id varchar(255),
	agencia_icms varchar(255),
	banco_icms varchar(255),
	codigo_tipo_recolhimento_icms varchar(255),
	cpf_responsavel_registro varchar(255),
	data_registro varchar(255),
	hora_registro varchar(255),
	nome_tipo_recolhimento_icms varchar(255),
	numero_sequencial_icms varchar(255),
	uf_icms varchar(255),
	valor_total_icms varchar(255)
)
;

create unique index icms_id_uindex
	on icms (id);

create table pagamento(
	document_id varchar(255),
	id bigserial not null
		constraint pagamento_pk
			primary key,
	declaracao_importacao_id varchar(255),
	agencia_pagamento varchar(255),
	banco_pagamento varchar(255),
	codigo_receita varchar(255),
	codigo_tipo_pagamento varchar(255),
	conta_pagamento varchar(255),
	data_pagamento varchar(255),
	nome_tipo_pagamento varchar(255),
	numero_retificacao varchar(255),
	valor_juros_encargos varchar(255),
	valor_multa varchar(255),
	valor_receita varchar(255)
)
;

create unique index pagamento_id_uindex
	on pagamento (id);

create table configurations(
	key varchar(255) not null
		constraint configurations_key_pk
			primary key,
	value varchar(255) not null
)
;

create unique index configurations_key_uindex on configurations (key);

create table file_sync(
	id bigserial not null
		constraint file_sync_pkey
			primary key,
	file_name varchar(255) not null,
	status varchar(255) default 'NEW'::character varying not null,
	content_size integer not null,
	read_count integer not null,
	locked boolean default false not null
);

create unique index file_sync_id_uindex	on file_sync (id);

create unique index file_sync_file_name_uindex on file_sync (file_name);

create table acrescimo(
	codigo_acrescimo varchar(255),
	denominacao varchar(255),
	moeda_negociacao_codigo varchar(255),
	moeda_negociada_nome varchar(255),
	valor_moeda_negociada varchar(255),
	valor_reais varchar(255),
	id bigserial not null
		constraint acrescimo_pk
			primary key,
	document_id varchar(255)
);

create unique index acrescimo_id_uindex	on acrescimo (id)
;

