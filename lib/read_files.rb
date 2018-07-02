module ReadFiles
  DEFAULT_PATH = Dir.pwd

  def discover_xml_files(path = DEFAULT_PATH)
    xml_files = File.join(path, '../', 'xml/')
    files = Dir.entries(xml_files)
    files_array = []
    files.keep_if {|f| f.match?(/\**.xml/)}.each do |p|
      f = File.new(xml_files + p)
      files_array << f ? f.is_a?(File) : nil
    end
    files_array
  end

  def discover_di_files(path = DEFAULT_PATH)
    xml_files = File.join(path, '../', 'dis/')
    files = Dir.entries(xml_files)
    files_array = []
    files.keep_if {|f| f.match?(/\**.xml/)}.each do |p|
      f = File.new(xml_files + p)
      files_array << f ? f.is_a?(File) : nil
    end
    files_array
  end
end