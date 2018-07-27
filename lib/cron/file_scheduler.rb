require 'rufus-scheduler'

class FileScheduler
  FileDir = Dir.pwd + '/dis/**.xml'

  def initialize(file)
    yield file
  end

  Rufus::Scheduler.singleton.every '10s' do

    files = Dir[FileDir]
    files.each {|f|
      Dynamics::FileSync.new {|fs|
        fs.file_name = f
        fs.content_size = 0
        fs.read_count = 0
        fs.status = 'NEW'
        fs.locked = false
        fs.save
      }
    }

  rescue StandardError => e
    puts e.to_s
  ensure

    files_to_sync = Dynamics::FileSync.where(status: 'NEW', locked: false).all

    files_to_sync.each do |f|

      file = File.open(f[:file_name])

      puts "IN file #{file.path}"

      f.locked = true
      f.save

      opts = Nokogiri::XML::ParseOptions::STRICT | Nokogiri::XML::ParseOptions::NOBLANKS
      doc = Nokogiri::XML(file, nil, 'UTF-8') do |config|
        config.options = opts
      end

      di_info = doc.xpath("//declaracaoImportacao")

      di_out = {}

      f.content_size = di_info.size
      f.save


      di_info.each do |info|

        f.read_count = 1

        Dynamics::Adicao.new do |adicao|
          adicoes = doc.xpath("//declaracaoImportacao//adicao")
          adicoes.each do |adc|


          end
        end

        Dynamics::Acrescimo.new do |acrescimo|
          acrescimos = doc.xpath("//declaracaoImportacao//adicao//acrescimo")

          acrescimos.each do |a|

            # Código Acrescimo
            codigo_acrescimo = a.at_css('codigoAcrescimo')
            acrescimo.codigo_acrescimo = codigo_acrescimo.content

            # Denominação
            denominacao = a.at_css('denominacao')
            acrescimo.denominacao = denominacao.content

            # Moeda Negociada Codigo
            moeda_negociacao_codigo = a.at_css('moedaNegociadaCodigo')
            acrescimo.moeda_negociacao_codigo = moeda_negociacao_codigo.content

            # Moeda Negociada Nome
            moeda_negociacada_nome = a.at_css('moedaNegociadaNome')
            acrescimo.moeda_negociada_nome = moeda_negociacada_nome.content

            # Valor Moeda Negociada
            valor_moeda_negociada = a.at_css('valorMoedaNegociada')
            acrescimo.valor_moeda_negociada = valor_moeda_negociada.content

            # Valor Reais
            valor_reais = a.at_css('valorReais')
            acrescimo.valor_reais = valor_reais.content

            acrescimo.save
          end
        end


        Dynamics::Mercadoria.new do |mercadoria|
          # Numero Adicao
          numero_adicao = info.at_css('numeroAdicao')
          mercadoria.adicao_id = numero_adicao.content

          # Descrição Mercadoria
          descricao_mercadoria = info.at_css('descricaoMercadoria')
          mercadoria.descricao_mercadoria = descricao_mercadoria.content

          # Numero Sequencial Item
          numero_sequencial_item = info.at_css('numeroSequencialItem')
          mercadoria.numero_sequencial_item = numero_sequencial_item.content

          # Quantidade
          quantidade = info.at_css('quantidade')
          mercadoria.quantidade = quantidade.content

          # Unidade Medida
          unidade_medida = info.at_css('unidadeMedida')
          mercadoria.unidade_medida = unidade_medida.content

          # Valor Unitário
          valor_unitario = info.at_css('valorUnitario')
          mercadoria.valor_unitario = valor_unitario.content

          mercadoria.save
        end


        Dynamics::DestaqueNcm.new do |destaque|

          # Numero Adicao
          numero_adicao = info.at_css('numeroAdicao')
          destaque.adicao_id = numero_adicao.content

          # Numero Destaque
          destaque_ncm = info.at_css('destaqueNcm')
          destaque.numero_destaque = destaque_ncm.content

          destaque.save
        end

        Dynamics::Icms.new do |icms|

          # Numero DI
          numero_di = info.at_css('numeroDI')
          numero_di.content = "#{numero_di.content[0..1]}/#{numero_di.content[2..8]}-#{numero_di.content[9]}"
          icms.declaracao_importacao_id = numero_di.content

          # ICMS
          icms_info = info.at_css('icms')

          # ICMS-Agencia
          agencia_icms = icms_info.at_css('agenciaIcms')
          icms.agencia_icms = agencia_icms.content


          # ICMS-Banco
          banco_icms = icms_info.at_css('bancoIcms')
          icms.banco_icms = banco_icms.content

          # ICMS-cod.tipo recolhimento
          cod_tipo_recolhimento_icms = icms_info.at_css('codigoTipoRecolhimentoIcms')
          icms.codigo_tipo_recolhimento_icms = cod_tipo_recolhimento_icms.content

          # ICMS-cpf responsavel registro
          cpf_responsavel_registro = icms_info.at_css('cpfResponsavelRegistro')
          cpf_responsavel_registro.content = "#{cpf_responsavel_registro.content[0..2]}.#{cpf_responsavel_registro.content[3..5]}.#{cpf_responsavel_registro.content[6..8]}-#{cpf_responsavel_registro.content[9..10]}"
          icms.cpf_responsavel_registro = cpf_responsavel_registro.content

          # ICMS-data pagamento
          data_registro = info.at_css('dataRegistro')
          data_registro.content = "#{data_registro.content[6..7]}/#{data_registro.content[4..5]}/#{data_registro.content[0..3]}"
          icms.data_registro = data_registro.content

          # ICMS-hora registro
          hora_registro = info.at_css('horaRegistro')
          hora_registro.content = "#{hora_registro.content[0..1]}:#{hora_registro.content[2..3]}:#{hora_registro.content[4..5]}"
          icms.hora_registro = hora_registro.content

          # ICMS-nome tipo recolhimento
          nome_tipo_recolhimento_icms = info.at_css('nomeTipoRecolhimentoIcms')
          icms.nome_tipo_recolhimento_icms = nome_tipo_recolhimento_icms.content

          # ICMS-numero sequencial
          numero_sequencial_icms = info.at_css('numeroSequencialIcms')
          icms.numero_sequencial_icms = numero_sequencial_icms.content

          # ICMS-Unidade Federação
          uf_icms = info.at_css('ufIcms')
          icms.uf_icms = uf_icms.content

          # ICMS-valor total
          valor_total_icms = info.at_css('valorTotalIcms')
          icms.valor_total_icms = valor_total_icms.content

          icms.save

        end

        # Importador Nº
        numero_importador = info.at_css('importadorNumero')
        di_out[:numero_importador] = numero_importador
        numero_importador.content = "#{numero_importador.content[0..1]}.#{numero_importador.content[2..4]}.#{numero_importador.content[5..7]}/#{numero_importador.content[8..11]}-#{numero_importador.content[12..13]}"

        f.read_count += 1
      end

      f.status = 'PROCESSED'
      f.save
    end
  end
end