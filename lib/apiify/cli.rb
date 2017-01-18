require 'thor'
require 'apiify'

class Apiify::CLI < Thor

  desc "get_file_name CSV", "returns the file name"
  def get_file_name(csv_path)
    puts Apiify::CsvConverter.get_file_name(csv_path)
  end

end
