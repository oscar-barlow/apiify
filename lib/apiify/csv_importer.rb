require 'active_support/inflector'
require 'active_support'


class Apiify::CsvImporter

  def import(csv_path)
    create_rake_file
    run_rake_task(csv_path)
    output_message(csv_path)
  end

  def create_rake_file
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
  end

  def run_rake_task(csv_path)
    system("bin/rake import_csv\[#{csv_path}\]")
  end

  def output_message(csv_path)
    rows = CSV.table("#{csv_path}").length
    puts "#{rows} records imported successfully."
  end

end
