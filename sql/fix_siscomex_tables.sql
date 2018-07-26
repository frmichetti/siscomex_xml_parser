alter table declaracaoimportacao rename to declaracao_importacao;
alter table destaquencm rename to destaque_ncm;
alter table documentoinstrucaodespacho rename to documento_instrucao_despacho;
alter table listadeclaracoes rename to lista_declaracoes;

/*Adição*/
alter table adicao rename column adicao_id to id;
alter table adicao rename column declaracaoimportacao_id to declaracao_importacao_id;
alter table adicao rename column cidevaloraliquotaespecifica to cide_valor_aliquota_especifica;
alter table adicao rename column cidevalordevido to cide_valor_devido;
alter table adicao rename column cidevalorrecolher to cide_valor_recolher;
alter table adicao rename column codigorelacaocompradorvendedor to codigo_relacao_comprador_vendedor;
alter table adicao rename column codigovinculocompradorvendedor to codigo_vinculo_comprador_vendedor;
alter table adicao rename column cofinsaliquotaadvalorem to cofins_aliquota_advalorem;
alter table adicao rename column cofinsaliquotaespecificaquantidadeunidade to cofins_aliquota_especifica_quantidade_unidade;
alter table adicao rename column cofinsaliquotaespecificavalor to cofins_aliquota_especifica_valor;
alter table adicao rename column cofinsaliquotareduzida to cofins_aliquota_reduzida;
alter table adicao rename column cofinsaliquotavalordevido to cofins_aliquota_valor_devido;
alter table adicao rename column cofinsaliquotavalorrecolher to cofins_aliquota_valor_recolher;
alter table adicao rename column condicaovendaincoterm to condicao_venda_incoterm;
alter table adicao rename column condicaovendalocal to condicao_venda_local;
alter table adicao rename column condicaovendametodovaloracaocodigo to condicao_venda_metodo_valor_acao_codigo;
alter table adicao rename column condicaovendametodovaloracaonome to condicao_venda_metodo_valor_acao_nome;
alter table adicao rename column condicaovendamoedacodigo to condicao_venda_moeda_codigo;
alter table adicao rename column condicaovendamoedanome to condicao_venda_moeda_nome;
alter table adicao rename column condicaovendavalormoeda to condicao_venda_valor_moeda;
alter table adicao rename column condicaovendavalorreais to condicao_venda_valor_reais;
alter table adicao rename column dadoscambiaiscoberturacambialcodigo to dados_cambiais_cobertura_cambial_codigo;
alter table adicao rename column dadoscambiaiscoberturacambialnome to dados_cambiais_cobertura_cambial_nome;
alter table adicao rename column dadoscambiaisinstituicaofinanciadoracodigo to dados_cambiais_instituicao_financiadora_codigo;
alter table adicao rename column dadoscambiaisinstituicaofinanciadoranome to dados_cambiais_instituicao_financiadora_nome;
alter table adicao rename column dadoscambiaismotivosemcoberturacodigo to dados_cambiais_motivo_sem_cobertura_codigo;
alter table adicao rename column dadoscambiaismotivosemcoberturanome to dados_cambiais_motivo_sem_cobertura_nome;
alter table adicao rename column dadoscambiaisvalorrealcambio to dados_cambiais_valor_real_cambio;
alter table adicao rename column dadoscargapaisprocedenciacodigo to dados_carga_pais_procedencia_codigo;
alter table adicao rename column dadoscargaurfentradacodigo to dados_carga_urf_entrada_codigo;
alter table adicao rename column dadoscargaviatransportecodigo to dados_carga_via_transporte_codigo;
alter table adicao rename column dadosmercadoriaaplicacao to dados_mercadoria_aplicacao;
alter table adicao rename column dadosmercadoriacodigonaladincca to dados_mercadoria_codigo_naladi_ncca;
alter table adicao rename column dadosmercadoriacodigonaladish to dados_mercadoria_codigo_naladish;
alter table adicao rename column dadosmercadoriacodigoncm to dados_mercadoria_codigo_ncm;
alter table adicao rename column dadosmercadoriacondicao to dados_mercadoria_condicao;
alter table adicao rename column dadosmercadoriamedidaestatisticaquantidade to dados_mercadoria_medida_estatistica_quantidade;
alter table adicao rename column dadosmercadoriamedidaestatisticaunidade to dados_mercadoria_medida_estatistica_unidade;
alter table adicao rename column dadosmercadorianomencm to dados_mercadoria_nome_ncm;
alter table adicao rename column dadosmercadoriapesoliquido to dados_mercadoria_peso_liquido;
alter table adicao rename column dcrcoeficientereducao to dcr_coeficiente_reducao;
alter table adicao rename column dcridentificacao to dcr_identificacao;
alter table adicao rename column dcrvalordevido to dcr_valor_devido;
alter table adicao rename column dcrvalordolar to dcr_valor_dolar;
alter table adicao rename column dcrvalorreal to dcr_valor_real;
alter table adicao rename column dcrvalorrecolher to dcr_valor_recolher;
alter table adicao rename column fabricantecidade to fabricante_cidade;
alter table adicao rename column fabricantecomplemento to fabricante_complemento;
alter table adicao rename column fabricanteestado to fabricante_estado;
alter table adicao rename column fabricantelogradouro to fabricante_logradouro;
alter table adicao rename column fabricantenome to fabricante_nome;
alter table adicao rename column fabricantenumero to fabricante_numero;
alter table adicao rename column fornecedorcidade to fornecedor_cidade;
alter table adicao rename column fornecedorcomplemento to fornecedor_complemento;
alter table adicao rename column fornecedorlogradouro to fornecedor_logradouro;
alter table adicao rename column fornecedornome to fornecedor_nome;
alter table adicao rename column fornecedornumero to fornecedor_numero;
alter table adicao rename column fretemoedanegociadacodigo to frete_moeda_negociada_codigo;
alter table adicao rename column fretevalormoedanegociada to frete_valor_moeda_negociada;
alter table adicao rename column fretevalorreais to frete_valor_reais;
alter table adicao rename column iiacordotarifariotipocodigo to ii_acordo_tarifario_tipo_codigo;
alter table adicao rename column iialiquotaacordo to ii_aliquota_acordo;
alter table adicao rename column iialiquotaadvalorem to ii_aliquota_advalorem;
alter table adicao rename column iialiquotapercentualreducao to ii_aliquota_percentual_reducao;
alter table adicao rename column iialiquotareduzida to ii_aliquota_reduzida;
alter table adicao rename column iialiquotavalorcalculado to ii_aliquota_valor_calculado;
alter table adicao rename column iialiquotavalordevido to ii_aliquota_valor_devido;
alter table adicao rename column iialiquotavalorrecolher to ii_aliquota_valor_recolher;
alter table adicao rename column iialiquotavalorreduzido to ii_aliquota_valor_reduzido;
alter table adicao rename column iibasecalculo to ii_base_calculo;
alter table adicao rename column iiextarifarioatolegalano to ii_ex_tarifario_ato_legal_ano;
alter table adicao rename column iiextarifarioatolegalcodigo to ii_ex_tarifario_ato_legal_codigo;
alter table adicao rename column iiextarifarioatolegalex to ii_ex_tarifario_ato_legal_ex;
alter table adicao rename column iiextarifarioatolegalnumero to ii_ex_tarifario_ato_legal_numero;
alter table adicao rename column iiextarifarioatolegalorgaoemissor to ii_ex_tarifario_ato_legal_orgao_emissor;
alter table adicao rename column iifundamentolegalcodigo to ii_fundamento_legal_codigo;
alter table adicao rename column iimotivoadmissaotemporariacodigo to ii_motivo_admissao_temporaria_codigo;
alter table adicao rename column iiregimetributacaocodigo to ii_regime_tributacao_codigo;
alter table adicao rename column iiregimetributacaonome to ii_regime_tributacao_nome;
alter table adicao rename column ipialiquotaadvalorem to ipi_aliquota_advalorem;
// TODO FIXME ipi_aliquota_especifica_capacidade_recipciente
alter table adicao rename column ipialiquotaespecificacapacidaderecipciente to ipi_aliquota_especifica_capacidade_recipciente;
alter table adicao rename column ipialiquotaespecificaquantidadeunidademedida to ipi_aliquota_especifica_quantidade_unidade_medida;
alter table adicao rename column ipialiquotaespecificatiporecipientecodigo to ipi_aliquota_especifica_tipo_recipiente_codigo;
alter table adicao rename column ipialiquotaespecificavalorunidademedida to ipi_aliquota_especifica_valor_unidade_medida;
alter table adicao rename column ipialiquotanotacomplementartipi to ipi_aliquota_nota_complementar_tipi;
alter table adicao rename column ipialiquotareduzida to ipi_aliquota_reduzida;
alter table adicao rename column ipialiquotavalordevido to ipi_aliquota_valor_devido;
alter table adicao rename column ipialiquotavalorrecolher to ipi_aliquota_valor_recolher;
alter table adicao rename column ipiregimetributacaocodigo to ipi_regime_tributacao_codigo;
alter table adicao rename column ipiregimetributacaonome to ipi_regime_tributacao_nome;
alter table adicao rename column numeroadicao to numero_adicao;
alter table adicao rename column numerodi to numero_di;
alter table adicao rename column numeroli to numero_li;
alter table adicao rename column paisaquisicaomercadoriacodigo to pais_aquisicao_mercadoria_codigo;
alter table adicao rename column paisaquisicaomercadorianome to pais_aquisicao_mercadoria_nome;
alter table adicao rename column paisorigemmercadoriacodigo to pais_origem_mercadoria_codigo;
alter table adicao rename column paisorigemmercadorianome to pais_origem_mercadoria_nome;
alter table adicao rename column piscofinsbasecalculoaliquotaicms to pis_cofins_base_calculo_aliquota_icms;
alter table adicao rename column piscofinsbasecalculofundamentolegalcodigo to pis_cofins_base_calculo_fundamento_legal_codigo;
alter table adicao rename column piscofinsbasecalculopercentualreducao to pis_cofins_base_calculo_percentual_reducao;
alter table adicao rename column piscofinsbasecalculovalor to pis_cofins_base_calculo_valor;
alter table adicao rename column piscofinsfundamentolegalreducaocodigo to pis_cofins_fundamento_legal_reducao_codigo;
alter table adicao rename column piscofinsregimetributacaocodigo to pis_cofins_regime_tributacao_codigo;
alter table adicao rename column piscofinsregimetributacaonome to pis_cofins_regime_tributacao_nome;
alter table adicao rename column pispasepaliquotaadvalorem to pis_pasep_aliquota_advalorem;
alter table adicao rename column pispasepaliquotaespecificaquantidadeunidade to pis_pasep_aliquota_especifica_quantidade_unidade;
alter table adicao rename column pispasepaliquotaespecificavalor to pis_pasep_aliquota_especifica_valor;
alter table adicao rename column pispasepaliquotareduzida to pis_pasep_aliquota_reduzida;
alter table adicao rename column pispasepaliquotavalordevido to pis_pasep_aliquota_valor_devido;
alter table adicao rename column pispasepaliquotavalorrecolher to pis_pasep_aliquota_valor_recolher;
alter table adicao rename column relacaocompradorvendedor to relacao_comprador_vendedor;
alter table adicao rename column seguromoedanegociadacodigo to seguro_moeda_negociada_codigo;
alter table adicao rename column segurovalormoedanegociada to seguro_valor_moeda_negociada;
alter table adicao rename column segurovalorreais to seguro_valor_reais;
alter table adicao rename column sequencialretificacao to sequencial_retificacao;
alter table adicao rename column valormultaarecolher to valor_multa_a_recolher;
alter table adicao rename column valormultaarecolherajustado to valor_multa_a_recolher_ajustado;
alter table adicao rename column valorreaisfreteinternacional to valor_reais_frete_internacional;
alter table adicao rename column valorreaissegurointernacional to valor_reais_seguro_internacional;
alter table adicao rename column valortotalcondicaovenda to valor_total_condicao_venda;
alter table adicao rename column vinculocompradorvendedor to vinculo_comprador_vendedor;
alter table adicao rename column destaquencm_id to destaque_ncm_id;
/*Adição*/

/*Declaração de Importação*/
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
/*Declaração de Importação*/

/*Pagamento*/
alter table pagamento rename column pagamento_id to id;
alter table pagamento rename column declaracaoimportacao_id to declaracao_importacao_id;
alter table pagamento rename column agenciapagamento to agencia_pagamento;
alter table pagamento rename column bancopagamento to banco_pagamento;
alter table pagamento rename column codigoreceita to codigo_receita;
alter table pagamento rename column codigotipopagamento to codigo_tipo_pagamento;
alter table pagamento rename column contapagamento to conta_pagamento;
alter table pagamento rename column datapagamento to data_pagamento;
alter table pagamento rename column nometipopagamento to nome_tipo_pagamento;
alter table pagamento rename column numeroretificacao to numero_retificacao;
alter table pagamento rename column valorjurosencargos to valor_juros_encargos;
alter table pagamento rename column valormulta to valor_multa;
alter table pagamento rename column valorreceita to valor_receita;
/*Pagamento*/

/*Mercadoria*/
alter table mercadoria rename column mercadoria_id to id;
alter table mercadoria rename column descricaomercadoria to descricao_mercadoria;
alter table mercadoria rename column numerosequencialitem to numero_sequencial_item;
alter table mercadoria rename column unidademedida to unidade_medida;
alter table mercadoria rename column valorunitario to valor_unitario;
/*Mercadoria*/

/*Lista de Declarações*/
alter table lista_declaracoes rename column declaracaoimportacao_id to declaracao_importacao_id;
alter table lista_declaracoes rename column lista_declaracoes_id to id;
/*Lista de Declarações*/

/*ICMS*/
alter table icms rename column icms_id to id;
alter table icms rename column declaracaoimportacao_id to declaracao_importacao_id;
alter table icms rename column agenciaicms to agencia_icms;
alter table icms rename column bancoicms to banco_icms;
alter table icms rename column codigotiporecolhimentoicms to codigo_tipo_recolhimento_icms;
alter table icms rename column cpfresponsavelregistro to cpf_responsavel_registro;
alter table icms rename column dataregistro to data_registro;
alter table icms rename column horaregistro to hora_registro;
alter table icms rename column nometiporecolhimentoicms to nome_tipo_recolhimento_icms;
alter table icms rename column numerosequencialicms to numero_sequencial_icms;
alter table icms rename column uficms to uf_icms;
alter table icms rename column valortotalicms to valor_total_icms;
/*ICMS*/

/*Embalagem*/
alter table embalagem rename column embalagem_id to id;
alter table embalagem rename column declaracaoimportacao_id to declaracao_importacao_id;
alter table embalagem rename column codigotipoembalagem to codigo_tipo_embalagem;
alter table embalagem rename column nomeembalagem to nome_embalagem;
alter table embalagem rename column quantidadevolume to quantidade_volume;
/*Embalagem*/

/*Destaque NCM*/
alter table destaque_ncm rename column destaquencm_id to destaque_ncm_id;
alter table destaque_ncm rename column numerodestaque to numero_destaque;
/*Destaque NCM*/

/*Documento Instrução Despacho*/
alter table documento_instrucao_despacho rename column documentoinstrucaodespacho_id to id;
alter table documento_instrucao_despacho rename column declaracaoimportacao_id to declaracao_importacao_id;
alter table documento_instrucao_despacho rename column codigotipodocumentodespacho to codigo_tipo_documento_despacho;
alter table documento_instrucao_despacho rename column nomedocumentodespacho to nome_documento_despacho;
alter table documento_instrucao_despacho rename column numerodocumentodespacho to numero_documento_despacho;
/*Documento Instrução Despacho*/