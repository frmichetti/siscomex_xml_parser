module ReadParseXML
  OPTS = Nokogiri::XML::ParseOptions::STRICT | Nokogiri::XML::ParseOptions::NOBLANKS

  def parse_xml(file)

    di_array = []

    puts "IN file #{file.path}"
    doc = Nokogiri::XML(file, nil, 'UTF-8') do |config|
      config.options = OPTS
    end

    di_info = doc.xpath("//declaracaoImportacao")

    di_out = {}

    di_info.each do |info|

      # Numero DI
      numero_di = info.at_css('numeroDI')
      di_out[:numero_di] = numero_di
      numero_di.content = "#{numero_di.content[0..1]}/#{numero_di.content[2..8]}-#{numero_di.content[9]}"
      puts numero_di

      # Importador Nº
      numero_importador = info.at_css('importadorNumero')
      di_out[:numero_importador] = numero_importador
      numero_importador.content = "#{numero_importador.content[0..1]}.#{numero_importador.content[2..4]}.#{numero_importador.content[5..7]}/#{numero_importador.content[8..11]}-#{numero_importador.content[12..13]}"
      puts numero_importador

      # ICMS
      icms_info = info.at_css('icms')

      # ICMS-Agencia
      agencia_icms = icms_info.at_css('agenciaIcms')
      di_out[:agencia_icms] = agencia_icms
      puts agencia_icms

      # ICMS-Banco
      banco_icms = icms_info.at_css('bancoIcms')
      di_out[:banco_icms] = banco_icms
      puts banco_icms

      # ICMS-cod.tipo recolhimento
      cod_tipo_recolhimento_icms = icms_info.at_css('codigoTipoRecolhimentoIcms')
      di_out[:cod_tipo_recolhimento_icms] = cod_tipo_recolhimento_icms
      puts cod_tipo_recolhimento_icms

      # ICMS-cpf responsavel registro
      cpf_responsavel_registro = icms_info.at_css('cpfResponsavelRegistro')
      di_out[:cpf_responsavel_registro] = cpf_responsavel_registro
      cpf_responsavel_registro.content = "#{cpf_responsavel_registro.content[0..2]}.#{cpf_responsavel_registro.content[3..5]}.#{cpf_responsavel_registro.content[6..8]}-#{cpf_responsavel_registro.content[9..10]}"
      puts cpf_responsavel_registro

      # ICMS-data pagamento
      data_registro = info.at_css('dataRegistro')
      data_registro.content = "#{data_registro.content[6..7]}/#{data_registro.content[4..5]}/#{data_registro.content[0..3]}"
      di_out[:data_registro] = data_registro
      puts data_registro

      # ICMS-hora registro
      hora_registro = info.at_css('horaRegistro')
      hora_registro.content = "#{hora_registro.content[0..1]}:#{hora_registro.content[2..3]}:#{hora_registro.content[4..5]}"
      di_out[:hora_registro] = hora_registro
      puts hora_registro

      # ICMS-nome tipo recolhimento
      nome_tipo_recolhimento_icms = info.at_css('nomeTipoRecolhimentoIcms')
      di_out[:nome_tipo_recolhimento_icms] = nome_tipo_recolhimento_icms
      puts nome_tipo_recolhimento_icms

      # ICMS-numero sequencial
      numero_sequencial_icms = info.at_css('numeroSequencialIcms')
      di_out[:numero_sequencial_icms] = numero_sequencial_icms
      puts numero_sequencial_icms

      # ICMS-Unidade Federação
      uf_icms = info.at_css('ufIcms')
      di_out[:uf_icms] = uf_icms
      puts uf_icms

      # ICMS-valor total
      valor_total_icms = info.at_css('valorTotalIcms')
      di_out[:valor_total_icms] = valor_total_icms
      puts valor_total_icms

      di_array << di_out
      di_out = {}

    end
    di_array

  end
end