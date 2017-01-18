require 'thor'
require 'apiify'

class Apiify::CLI < Thor

  desc "generate", "should build scaffold"
  def generate(csv_path)
    scaffolder = Apiify::Scaffolder.new
    system(scaffolder.create_scaffold(csv_path))
    system("bin/rake db:migrate")
    importer = Apiify::CsvImporter.new
    importer.import_csv(csv_path)
    puts "success"
  end


end
