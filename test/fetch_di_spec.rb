require 'rspec'
require 'nokogiri'
require 'axlsx'

require_relative '../lib/loadpath'
require 'requires'

describe 'Read a XML and Fetch for DI' do

  files = []
  di_array = []
  di_number = '1812021722'
  looking_for_di = nil

  before do
    extend ReadFiles

    files = discover_di_files
  end

  it 'parse_xml_file and fetch for di number' do
    opts = Nokogiri::XML::ParseOptions::STRICT | Nokogiri::XML::ParseOptions::NOBLANKS

    files.each do |f|
      puts "IN file #{f.path}"
      doc = Nokogiri::XML(f, nil, 'UTF-8') do |config|
        config.options = opts
      end

      di_info = doc.xpath("//declaracaoImportacao")

      di_out = {}

      di_info.each do |info|

        # Numero DI
        numero_di = info.at_css('numeroDI')
        expect(numero_di).not_to be_nil
        puts 'FOUND DI ' + numero_di
      end

      di_info.each do |info|

        # Numero DI
        numero_di = info.at_css('numeroDI')

        if numero_di.content === di_number
          puts 'LOOKUP FOR DI == ' + di_number
          looking_for_di = info
          # puts looking_for_di

          values = %i(numeroDI agenciaIcms bancoIcms codigoTipoRecolhimentoIcms cpfResponsavelRegistro dataRegistro horaRegistro nomeTipoRecolhimentoIcms numeroSequencialIcms ufIcms valorTotalIcms)

          values.each {|v|

            var = info.at_css(v.to_s)
            di_out[v] = var
            puts var

            unless looking_for_di.nil?
              di_out[v] = looking_for_di.at_css(v.to_s)
            end
          }

          di_array << di_out
          di_out = {}

          # break
        end

      end
    end
  end


  it 'save xml file' do
    extend WriteXLS

    date_time = DateTime.now.to_s
    date_time.gsub!(":", '-')

    file_name = "../output/relatorio.fetch.di.#{di_number}.#{date_time}.xlsx"

    save_xls_file_report(di_array, file_name)

  end

end