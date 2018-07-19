require 'rspec'
require 'nokogiri'
require 'axlsx'

require_relative '../lib/loadpath'
require 'requires'


describe 'Read XML and Parse to XLS' do

  files = []
  di_array = []

  before do
    extend ReadFiles

    files = discover_di_files
  end

  it 'parse_xml_file' do
    opts = Nokogiri::XML::ParseOptions::STRICT | Nokogiri::XML::ParseOptions::NOBLANKS

    files.each do |f|
      doc = Nokogiri::XML(f, nil, 'UTF-8') do |config|
        config.options = opts
      end

      di_info = doc.xpath("//declaracaoImportacao")

      di_out = {}

      di_info.each do |info|

        # Numero DI
        numero_di = info.at_css('numeroDI')
        di_out[:numero_di] = numero_di
        expect(numero_di).not_to be_nil
        puts numero_di

        # ICMS
        icms_info = info.at_css('icms')

        # ICMS-Agencia
        agencia_icms = icms_info.at_css('agenciaIcms')
        di_out[:agencia_icms] = agencia_icms
        expect(agencia_icms).not_to be_nil
        puts agencia_icms

        # ICMS-Banco
        banco_icms = icms_info.at_css('bancoIcms')
        di_out[:banco_icms] = banco_icms
        expect(banco_icms).not_to be_nil
        puts banco_icms

        # ICMS-cod.tipo recolhimento
        cod_tipo_recolhimento_icms = icms_info.at_css('codigoTipoRecolhimentoIcms')
        di_out[:cod_tipo_recolhimento_icms] = cod_tipo_recolhimento_icms
        expect(cod_tipo_recolhimento_icms).not_to be_nil
        puts cod_tipo_recolhimento_icms

        # ICMS-cpf responsavel registro
        cpf_responsavel_registro = icms_info.at_css('cpfResponsavelRegistro')
        di_out[:cpf_responsavel_registro] = cpf_responsavel_registro
        expect(cpf_responsavel_registro).not_to be_nil
        puts cpf_responsavel_registro

        # ICMS-data pagamento
        data_registro = info.at_css('dataRegistro')
        expect(data_registro).not_to be_nil
        data_registro.content = "#{data_registro.content[6..7]}/#{data_registro.content[4..5]}/#{data_registro.content[0..3]}"
        di_out[:data_registro] = data_registro
        puts data_registro

        # ICMS-hora registro
        hora_registro = info.at_css('horaRegistro')
        expect(hora_registro).not_to be_nil
        di_out[:hora_registro] = hora_registro
        puts hora_registro

        # ICMS-nome tipo recolhimento
        nome_tipo_recolhimento_icms = info.at_css('nomeTipoRecolhimentoIcms')
        expect(nome_tipo_recolhimento_icms).not_to be_nil
        di_out[:nome_tipo_recolhimento_icms] = nome_tipo_recolhimento_icms
        puts nome_tipo_recolhimento_icms

        # ICMS-numero sequencial
        numero_sequencial_icms = info.at_css('numeroSequencialIcms')
        expect(numero_sequencial_icms).not_to be_nil
        di_out[:numero_sequencial_icms] = numero_sequencial_icms
        puts numero_sequencial_icms

        # ICMS-Unidade Federação
        uf_icms = info.at_css('ufIcms')
        expect(uf_icms).not_to be_nil
        di_out[:uf_icms] = uf_icms
        puts uf_icms

        # ICMS-valor total
        valor_total_icms = info.at_css('valorTotalIcms')
        expect(valor_total_icms).not_to be_nil
        di_out[:valor_total_icms] = valor_total_icms
        puts valor_total_icms

        di_array << di_out
        di_out = {}

      end
    end
  end

  it 'save xml file' do
    extend WriteXLS

    save_xls_file_report(di_array)

  end


end
