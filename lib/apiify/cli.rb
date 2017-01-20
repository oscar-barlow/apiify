require 'thor'
require 'apiify'

class Apiify::CLI < Thor

  desc "new", "extracts file name and creates a model and properties based on CSV file name and header columns"
  def new(csv_path, index_col = nil)
    scaffolder = Apiify::Scaffolder.new
    scaffolder.generate(csv_path, index_col)
  end

  desc "import", "extracts all rows from CSV and populates your database"
  def import(csv_path)
    importer = Apiify::CsvImporter.new
    importer.import(csv_path)
  end


end
