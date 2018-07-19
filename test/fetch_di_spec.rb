require 'rspec'
require 'nokogiri'
require 'axlsx'

require_relative '../lib/loadpath'
require 'requires'

describe 'Read a XML and Fetch for DI' do

  files = []
  di_array = []
  looking_for_di = nil

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


        if numero_di.content == '1812022150'
          puts 'LOOK ==' + '1812022150'
          looking_for_di = info
          puts looking_for_di
          unless looking_for_di.nil?
            puts looking_for_di.at_css('valorReais').content
          end


          break
        end

      end
    end
  end
end