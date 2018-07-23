module WriteXLS
  DEFAULT_PATH = Dir.pwd

  def write_xls_file(path = DEFAULT_PATH)
    path
  end


  def save_xls_file_report(di_array, name = nil)

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

        rows = %w(NumeroDI NumeroImportador AgenciaIcms BancoIcms CodigoTipoRecolhimentoIcms CpfResponsavelRegistro DataRegistro HoraRegistro NomeTipoRecolhimentoICMS NumeroSequencialICMS UFICMS ValorTotalICMS)

        ws.add_row rows, :style => header

        # Passing one style applies the style to all columns
        di_array.each do |row|
          contents = row.collect {|_k, v| v.content}
          ws.add_row contents, :style => pascal
        end

      end
    end

    date_time = DateTime.now.to_s
    date_time.gsub!(":", '-')

    unless di_array.empty?
      if name.nil? then
        p.serialize "../output/relatorio.dis.#{date_time}.xlsx"
      else
        p.serialize name
      end
    end
  end

end