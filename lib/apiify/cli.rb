require 'thor'
require 'apiify'
require 'csv'

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
    File.open("./lib/tasks/importer.rake", 'w') do |f|
      f.write("require 'CSV'
      task :import_csv, [:file_path] => :environment do |t, args|
        file_name = args[:file_path].split('/').last.split('.').first
        model_name = file_name.capitalize.constantize
        table = CSV.table(args[:file_path])
        table.each do |row|
          model_name.create!(row.to_hash)
        end
      end")
    end
    system("bin/rake import_csv\[#{csv_path}\]")
    rows = CSV.table("#{csv_path}").length
    puts "#{rows} records imported successfully."
  end


end
