module FileCopy
  def copy(source, target)
    File.open(source, 'rb') do |infile|
      File.open(target, 'wb') do |outfile2|
        while buffer = infile.read(4096)
          outfile2 << buffer
        end
      end
    end
  end
end