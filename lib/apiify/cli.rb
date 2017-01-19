require 'thor'
require 'apiify'

class Apiify::CLI < Thor

  desc "new", "extracts file name and creates a model and properties based on CSV file name and header columns"
  def new(csv_path)
    scaffolder = Apiify::Scaffolder.new
    system(scaffolder.create_scaffold(csv_path))
    # system("bin/rake db:migrate") - we ask the user to do this bit themselves
    puts "Created #{scaffolder.get_file_name(csv_path).capitalize} model with properties #{scaffolder.hash_to_string(scaffolder.find_class(csv_path))}"
    puts "Please run `bin/rake db:migrate`"
  end

  desc "import", "extracts all rows from CSV and populates your database"
  def import(csv_path)
    importer = Apiify::CsvImporter.new
    importer.import_csv(csv_path)
    puts "Import of #{csv_path} successful"
  end


end
