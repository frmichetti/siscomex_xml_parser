module Controllers
  module FileCtrl

    DI_FILE_DIR = Dir.pwd + '/dis'
    XML_FILE_DIR = Dir.pwd + '/xml'

    class << self
      def included(controller)

        controller.namespace('/api') {|c|
          c.get('/files') {
            make_default_json_api(instance: self) {
              dis_paths = Dir[DI_FILE_DIR + '/**.xml']
              xml_paths = Dir[XML_FILE_DIR + '/**.xml']
              puts "teste"

              {dis: dis_paths, xml: xml_paths}
            }
          }

          c.delete('/files/:file_path/:file_name') {
            make_default_json_api(instance: self)

            puts "teste"
          }

          c.post('/file') {

            file = params[:file]

            extend FileCopy

            begin
              copy file[:tempfile], File.new(DI_FILE_DIR + '/' + file[:filename], 'w+')

              FileScheduler.new(File.open(DI_FILE_DIR + '/' + file[:filename])){ |file|
                extend ReadParseXML
                di_array = parse_xml(file)
                extend WriteXLS

                date_time = DateTime.now.to_s
                date_time.gsub!(":", '-')

                output_file_path = Dir.pwd + "/output/relatorio.dis.#{date_time}.xlsx"

                save_xls_file_report(di_array, output_file_path)

                temp = File.new(output_file_path)
                send_file temp.path, :filename => output_file_path, :type => "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"

                # output = {msg: "file upload successfull + #{file[:filename]}"}
                # [200, output.to_json]

              }
            rescue StandardError => e
              ModelException.new("Error on Upload", 400, 400, e).to_response
            end
          }
        }
      end
    end
  end
end
