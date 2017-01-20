require 'thor'
require 'apiify'

class Apiify::CLI < Thor

  desc "new <path-to-your-csv>", "extracts file name and creates a model and properties based on CSV file name and header columns"
  long_desc <<-APIIFYNEW
  This will run an API-appropriate scaffold via rails (i.e. a model,
  controller, and serializer will be created; so will a migration).

  IMPORTANT: the name of the model is derived from the file name. Therefore,
  please ensure your file is sensibly named:
  \x5
  Good: `bunny.csv` \x5
  Bad: `2017-list_of_bunnies-FINALv2.csv`

  APIIFYNEW
  def new(csv_path, index_col = nil)
    scaffolder = Apiify::Scaffolder.new
    scaffolder.generate(csv_path, index_col)
  end

  desc "import <path-to-your-csv>", "extracts all rows from CSV and populates your database"
  long_desc <<-APIIFYIMPORT
  This command imports every row in your CSV to a new row your database.

  IMPORTANT: make sure you have already run `apiify new` with your CSV, or
  import won't know where to put your data!
  APIIFYIMPORT
  def import(csv_path)
    importer = Apiify::CsvImporter.new
    importer.import(csv_path)
  end


end
