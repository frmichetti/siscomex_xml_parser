# frozen_string_literal: true

module Controllers
  module FileCtrl
    DI_FILE_DIR = Dir.pwd + '/dis'
    XML_FILE_DIR = Dir.pwd + '/xml'

    class << self
      def included(controller)
        controller.namespace('/api') do |c|
          c.get('/files') do
            make_default_json_api(instance: self) do
              dis_paths = Dir[DI_FILE_DIR + '/**.xml']
              xml_paths = Dir[XML_FILE_DIR + '/**.xml']
              dirs = {paths: dis_paths, label: :dis}, {paths: xml_paths, label: :xml}
              output = []

              dirs.each do |dir|
                dir[:paths].each do |p|
                  file = File.open(p)

                  output << dir[:label] = {
                      path: file.path,
                      size: file.size,
                      name: file.path.split('/').last,
                      extension: file.path.split('.').last,
                      modification_time: file.mtime,
                      last_access_time: file.atime,
                      birth_time: file.birthtime,
                      creation_time: file.ctime
                  }
                end
              end

              {dirs: output}
            end
          end

          c.delete('/files/:file_path/:file_name') do
            make_default_json_api(instance: self)

            puts 'teste'
          end

          c.post('/file') do
            file = params[:file]

            extend FileCopy

            begin
              # raise ModelException.new 'No file received.' unless file

              copy file[:tempfile], File.new(DI_FILE_DIR + '/' + file[:filename], 'w+')

              FileScheduler.new(File.open(DI_FILE_DIR + '/' + file[:filename])) do |file|
                extend ReadParseXML
                di_array = parse_xml(file)
                extend WriteXLS

                date_time = DateTime.now.to_s
                date_time.tr!(':', '-')

                output_file_path = Dir.pwd + "/output/relatorio.dis.#{date_time}.xlsx"

                save_xls_file_report(di_array, output_file_path)

                temp = File.new(output_file_path)
                send_file temp.path, filename: output_file_path, type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'

                # output = {msg: "file upload successfull + #{file[:filename]}"}
                # [200, output.to_json]
              end
            rescue StandardError => e
              ModelException.new('Error on Upload', 400, 400, e).to_response
            end
          end

          c.get('/consulta/:di_number') do
            begin
              extend ReadFiles
              di_array = []
              di_number = params[:di_number]

              files = discover_di_files(Dir.pwd + '/dis/')

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
                  puts 'FOUND DI ' + numero_di
                end

                di_info.each do |info|

                  # Numero DI
                  numero_di = info.at_css('numeroDI')

                  if numero_di.content === di_number
                    puts 'LOOKUP FOR DI == ' + di_number
                    looking_for_di = info
                    # puts looking_for_di

                    values = %i(numeroDI numeroImportador agenciaIcms bancoIcms codigoTipoRecolhimentoIcms cpfResponsavelRegistro dataRegistro horaRegistro nomeTipoRecolhimentoIcms numeroSequencialIcms ufIcms valorTotalIcms)

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

              extend WriteXLS

              date_time = DateTime.now.to_s
              date_time.gsub!(":", '-')

              file_name =  Dir.pwd + "/output/relatorio.fetch.di.#{di_number}.#{date_time}.xlsx"

              save_xls_file_report(di_array, file_name)

              temp = File.new(file_name)
              send_file temp.path, filename: file_name, type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
            end
          rescue StandardError => e
            ModelException.new('Error on Retrieve files', 400, 400, e).to_response
          end

          c.get('/consulta') do
            di_array = []

            extend ReadFiles
            files = discover_di_files(Dir.pwd + '/dis/')
            extend ReadParseXML

            files.each do |f|
              di_array << parse_xml(f)
            end

            di_array.flatten!

            extend WriteXLS

            date_time = DateTime.now.to_s
            date_time.tr!(':', '-')

            output_file_path = Dir.pwd + "/output/relatorio.dis.#{date_time}.xlsx"

            save_xls_file_report(di_array, output_file_path)

            temp = File.new(output_file_path)
            send_file temp.path, filename: output_file_path, type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
          rescue StandardError => e
            ModelException.new('Error on Retrieve files', 400, 400, e).to_response
          end
        end
      end
    end
  end
end
