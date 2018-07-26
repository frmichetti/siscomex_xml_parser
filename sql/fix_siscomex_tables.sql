alter table declaracaoimportacao rename to declaracao_importacao;
alter table destaquencm rename to destaque_ncm;
alter table documentoinstrucaodespacho rename to documento_instrucao_despacho;
alter table listadeclaracoes rename to lista_declaracoes;

alter table declaracao_importacao rename column declaracaoimportacao_id to id;
alter table declaracao_importacao rename column listadeclaracoes_id to lista_declaracoes_id;
alter table declaracao_importacao rename column armazenamentorecintoaduaneirocodigo to armazenamento_recinto_aduaneiro_codigo;
alter table declaracao_importacao rename column armazenamentorecintoaduaneironome to armazenamento_recinto_aduaneiro_nome;
alter table declaracao_importacao rename column armazenamentosetor to armazenamento_setor;
alter table declaracao_importacao rename column canalselecaoparametrizada to canal_selecao_parametrizada;
alter table declaracao_importacao rename column caracterizacaooperacaocodigotipo to caracterizacao_operacao_codigo_tipo;
alter table declaracao_importacao rename column caracterizacaooperacaodescricaotipo to caracterizacao_operacao_descricao_tipo;
alter table declaracao_importacao rename column cargadatachegada to carga_data_chegada;
alter table declaracao_importacao rename column carganumeroagente to carga_numero_agente;
alter table declaracao_importacao rename column cargapaisprocedenciacodigo to carga_pais_procedencia_codigo;
alter table declaracao_importacao rename column cargapaisprocedencianome to carga_pais_procedencia_nome;
alter table declaracao_importacao rename column cargapesobruto to carga_peso_bruto;
alter table declaracao_importacao rename column cargapesoliquido to carga_peso_liquido;
alter table declaracao_importacao rename column cargaurfentradacodigo to carga_urf_entrada_codigo;
alter table declaracao_importacao rename column cargaurfentradanome to carga_urf_entrada_nome;
alter table declaracao_importacao rename column conhecimentocargaembarquedata to conhecimento_carga_embarque_data;
alter table declaracao_importacao rename column conhecimentocargaembarquelocal to conhecimento_carga_embarque_local;
alter table declaracao_importacao rename column conhecimentocargaid to conhecimento_carga_id;
alter table declaracao_importacao rename column conhecimentocargaidmaster to conhecimento_carga_id_master;
alter table declaracao_importacao rename column conhecimentocargatipocodigo to conhecimento_carga_tipo_codigo;
alter table declaracao_importacao rename column conhecimentocargatiponome to conhecimento_carga_tipo_nome;
alter table declaracao_importacao rename column conhecimentocargautilizacao to conhecimento_carga_utilizacao;
alter table declaracao_importacao rename column conhecimentocargautilizacaonome to conhecimento_carga_utilizacao_nome;
alter table declaracao_importacao rename column datadesembaraco to data_desembaraco;
alter table declaracao_importacao rename column dataregistro to data_registro;
alter table declaracao_importacao rename column documentochegadacargacodigotipo to documento_chegada_carga_codigo_tipo;
alter table declaracao_importacao rename column documentochegadacarganome to documento_chegada_carga_nome;
alter table declaracao_importacao rename column documentochegadacarganumero to documento_chegada_carga_numero;
alter table declaracao_importacao rename column fretecollect to frete_collect;
alter table declaracao_importacao rename column freteemterritorionacional to frete_em_territorio_nacional;
alter table declaracao_importacao rename column fretemoedanegociadacodigo to frete_moeda_negociada_codigo;
alter table declaracao_importacao rename column fretemoedanegociadanome to frete_moeda_negociada_nome;
alter table declaracao_importacao rename column freteprepaid to frete_prepaid;
alter table declaracao_importacao rename column fretetotaldolares to frete_total_dolares;
alter table declaracao_importacao rename column fretetotalmoeda to frete_total_moeda;
alter table declaracao_importacao rename column fretetotalreais to frete_total_reais;
alter table declaracao_importacao rename column importadorcodigotipo to importador_codigo_tipo;
alter table declaracao_importacao rename column importadorcpfrepresentantelegal to importador_cpf_representante_legal;
alter table declaracao_importacao rename column importadorenderecobairro to importador_endereco_bairro;
alter table declaracao_importacao rename column importadorenderecocep to importador_endereco_cep;
alter table declaracao_importacao rename column importadorenderecocomplemento to importador_endereco_complemento;
alter table declaracao_importacao rename column importadorenderecologradouro to importador_endereco_logradouro;
alter table declaracao_importacao rename column importadorenderecomunicipio to importador_endereco_municipio;
alter table declaracao_importacao rename column importadorendereconumero to importador_endereco_numero;
alter table declaracao_importacao rename column importadorenderecouf to importador_endereco_uf;
alter table declaracao_importacao rename column importadornome to importador_nome;
alter table declaracao_importacao rename column importadornomerepresentantelegal to importador_nome_representante_legal;
alter table declaracao_importacao rename column importadornumero to importador_numero;
alter table declaracao_importacao rename column importadornumerotelefone to importador_numero_telefone;
alter table declaracao_importacao rename column informacaocomplementar to informacao_complementar;
alter table declaracao_importacao rename column localdescargatotaldolares to local_descarga_total_dolares;
alter table declaracao_importacao rename column localdescargatotalreais to local_descarga_total_reais;
alter table declaracao_importacao rename column localembarquetotaldolares to local_embarque_total_dolares;
alter table declaracao_importacao rename column localembarquetotalreais to local_embarque_total_reais;
alter table declaracao_importacao rename column modalidadedespachocodigo to modalidade_despacho_codigo
alter table declaracao_importacao rename column modalidadedespachonome to modalidade_despacho_nome;
alter table declaracao_importacao rename column numerodi to numero_di;
alter table declaracao_importacao rename column operacaofundap to operacao_fundap;
alter table declaracao_importacao rename column seguromoedanegociadacodigo to seguro_moeda_negociada_codigo;
alter table declaracao_importacao rename column seguromoedanegociadanome to seguro_moeda_negociada_nome;
alter table declaracao_importacao rename column segurototaldolares to seguro_total_dolares;
alter table declaracao_importacao rename column segurototalmoedanegociada to seguro_total_moeda_negociada;
alter table declaracao_importacao rename column segurototalreais to seguro_total_reais;
alter table declaracao_importacao rename column sequencialretificacao to sequencial_retificacao;
alter table declaracao_importacao rename column situacaoentregacarga to situacao_entrega_carga;
alter table declaracao_importacao rename column tipodeclaracaocodigo to tipo_declaracao_codigo;
alter table declaracao_importacao rename column tipodeclaracaonome to tipo_declaracao_nome;
alter table declaracao_importacao rename column totaladicoes to total_adicoes;
alter table declaracao_importacao rename column urfdespachocodigo to urf_despacho_codigo;
alter table declaracao_importacao rename column urfdespachonome to urf_despacho_nome;
alter table declaracao_importacao rename column valortotalmultaarecolherajustado to valor_total_multa_a_recolher_ajustado;
alter table declaracao_importacao rename column viatransportecodigo to via_transporte_codigo;
alter table declaracao_importacao rename column viatransportemultimodal to via_transporte_multimodal;
alter table declaracao_importacao rename column viatransportenome to via_transporte_nome;
alter table declaracao_importacao rename column viatransportenometransportador to via_transporte_nome_transportador;
alter table declaracao_importacao rename column viatransportepaistransportadorcodigo to via_transporte_pais_transportador_codigo;
alter table declaracao_importacao rename column viatransportepaistransportadornome to via_transporte_pais_transportador_nome;
alter table declaracao_importacao rename column documentoinstrucaodespacho_id to documento_instrucao_despacho_id;





















































