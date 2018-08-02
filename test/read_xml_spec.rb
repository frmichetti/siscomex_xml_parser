require 'rspec'
require 'nokogiri'
require 'axlsx'

require_relative '../lib/loadpath'
require 'requires'


describe 'My behaviour' do

  it 'should do something' do

    true.should == true
  end

  it 'parse a xml file' do
    opts = Nokogiri::XML::ParseOptions::STRICT | Nokogiri::XML::ParseOptions::NOBLANKS
    f = File.open(Dir.pwd + '/../xml/cd_catalog.xml')
    puts "IN file #{f.path}"
    doc = Nokogiri::XML(f, nil, 'UTF-8') do |config|
      config.options = opts
    end


    columns = doc.search('*').map(&:name)
    values = doc.search('*').map(&:content)

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

      wb.add_worksheet(:name => "XML - Recuperado") do |ws|
        ws.add_row ['XML'], :style => title
        ws.add_row

        rows = columns

        ws.add_row rows, :style => header

        # Passing one style applies the style to all columns

        ws.add_row values, :style => pascal


      end
    end

    date_time = DateTime.now.to_s
    date_time.gsub!(":", '-')

    p.serialize "../output/new.xml.#{date_time}.xlsx"


    expect(true).to be_truthy
  end
end