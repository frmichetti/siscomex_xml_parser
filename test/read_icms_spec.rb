#!/usr/bin/env ruby

require 'rspec'
require 'nokogiri'
require 'axlsx'

require_relative '../lib/loadpath'
require 'requires'


describe 'Read XML and Parse to XLS' do

  files = []
  icms_array = []

  before do
    extend ReadFiles

    files = discover_xml_files
  end

  it 'parse_xml_file' do
    opts = Nokogiri::XML::ParseOptions::STRICT | Nokogiri::XML::ParseOptions::NOBLANKS

    files.each do |f|
      puts "IN file #{f.path}"
      doc = Nokogiri::XML(f, nil, 'UTF-8') do |config|
        config.options = opts
      end

      icms_info = doc.xpath("//icms")
      di_info = doc.xpath("//numeroDI")

      icms_out = {}

      di_info.each {|info|

        # Declaracao de Importação
        numero_di = info
        numero_di.content = "#{numero_di.content[0..1]}/#{numero_di.content[2..8]}-#{numero_di.content[9]}"
        expect(numero_di).not_to be_nil
        icms_out[:numero_di] = numero_di

      }
      icms_info.each {|info|

        # ICMS-Agencia
        agencia_icms = info.at_css('agenciaIcms')
        expect(agencia_icms).not_to be_nil
        icms_out[:agencia_icms] = agencia_icms

        # ICMS-Banco
        banco_icms = info.at_css('bancoIcms')
        expect(banco_icms).not_to be_nil
        icms_out[:banco_icms] = banco_icms

        # ICMS-cod.tipo recolhimento
        codigo_tipo_recolhimento_icms = info.at_css('codigoTipoRecolhimentoIcms')
        expect(codigo_tipo_recolhimento_icms).not_to be_nil
        icms_out[:codigo_tipo_recolhimento_icms] = codigo_tipo_recolhimento_icms

        # ICMS-cpf responsavel registro
        cpf_responsavel_registro = info.at_css('cpfResponsavelRegistro')
        cpf_responsavel_registro.content = "#{cpf_responsavel_registro.content[0..2]}.#{cpf_responsavel_registro.content[3..5]}.#{cpf_responsavel_registro.content[6..8]}-#{cpf_responsavel_registro.content[9..10]}"
        expect(cpf_responsavel_registro).not_to be_nil
        icms_out[:cpf_responsavel_registro] = cpf_responsavel_registro

        # ICMS-data pagamento
        data_registro = info.at_css('dataRegistro')
        expect(data_registro).not_to be_nil
        data_registro.content = "#{data_registro.content[6..7]}/#{data_registro.content[4..5]}/#{data_registro.content[0..3]}"
        icms_out[:data_registro] = data_registro

        # ICMS-hora registro
        hora_registro = info.at_css('horaRegistro')
        hora_registro.content = "#{hora_registro.content[0..1]}:#{hora_registro.content[2..3]}:#{hora_registro.content[4..5]}"
        expect(hora_registro).not_to be_nil
        icms_out[:hora_registro] = hora_registro

        # ICMS-nome tipo recolhimento
        nome_tipo_recolhimento_icms = info.at_css('nomeTipoRecolhimentoIcms')
        expect(nome_tipo_recolhimento_icms).not_to be_nil
        icms_out[:nome_tipo_recolhimento_icms] = nome_tipo_recolhimento_icms

        # ICMS-numero sequencial
        numero_sequencial_icms = info.at_css('numeroSequencialIcms')
        expect(numero_sequencial_icms).not_to be_nil
        icms_out[:numero_sequencial_icms] = numero_sequencial_icms


        # ICMS-Unidade Federação
        uf_icms = info.at_css('ufIcms')
        expect(uf_icms).not_to be_nil
        icms_out[:uf_icms] = uf_icms

        # ICMS-valor total
        valor_total_icms = info.at_css('valorTotalIcms')
        expect(valor_total_icms).not_to be_nil
        icms_out[:valor_total_icms] = valor_total_icms

        puts info

        icms_array << icms_out

      }
    end
  end

  it 'save xml file' do

    # First, if you plan to use the generated file with Numbers, make sure to set “use_shared_strings” to true.

    p = Axlsx::Package.new

    # Required for use with numbers
    p.use_shared_strings = true


    # Next, after creating a workbook via a block, we’ll set up some styles to use later.

    p.workbook do |wb|
      # define your regular styles
      styles = wb.styles
      title = styles.add_style :sz => 15, :b => true, :u => true
      default = styles.add_style :border => Axlsx::STYLE_THIN_BORDER
      pascal_colors = {:bg_color => '567DCC', :fg_color => 'FFFF00'}
      pascal = styles.add_style pascal_colors.merge({:border => Axlsx::STYLE_THIN_BORDER, :b => true})
      header = styles.add_style :bg_color => '00', :fg_color => 'FF', :b => true
      money = styles.add_style :format_code => '#,###,##0', :border => Axlsx::STYLE_THIN_BORDER
      money_pascal = styles.add_style pascal_colors.merge({:format_code => '#,###,##0', :border => Axlsx::STYLE_THIN_BORDER})
      percent = styles.add_style :num_fmt => Axlsx::NUM_FMT_PERCENT, :border => Axlsx::STYLE_THIN_BORDER
      percent_pascal = styles.add_style pascal_colors.merge({:num_fmt => Axlsx::NUM_FMT_PERCENT, :border => Axlsx::STYLE_THIN_BORDER})


      # Next, we’ll create a worksheet for and add a few rows. Note that the worksheet name is limited to 31 characters.

      wb.add_worksheet(:name => "DI's - Recuperadas") do |ws|
        ws.add_row ['ICMS'], :style => title
        ws.add_row

        rows = %w(NumeroDI AgenciaIcms BancoIcms CodigoTipoRecolhimentoIcms CpfResponsavelRegistro DataRegistro HoraRegistro NomeTipoRecolhimentoIcms NumeroSequencialIcms UFIcms ValorTotalIcms)

        ws.add_row rows, :style => header

        # Passing one style applies the style to all columns
        icms_array.each {|row|

          contents = row.collect {|_k, v| v.content}
          ws.add_row contents, :style => pascal
        }

      end
    end

    date_time = DateTime.now.to_s
    date_time.gsub!(":", '-')

    p.serialize "../output/relatorio.icms.#{date_time}.xlsx"
  end
end
