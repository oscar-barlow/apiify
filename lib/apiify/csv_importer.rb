require 'active_support/inflector'
require 'active_support'


class Apiify::CsvImporter

  def get_file_name(csv_path)
    csv_path.split("/").last.split(".").first
  end


  def import_csv(csv_path)
    model_name = get_file_name(csv_path).capitalize.constantize
    #read the rows from the CSV file
    table = CSV.table(csv_path)
    #assign row content to our header properties
    table.each do |row|
      model_name.create!(row.to_hash)
    end
  end

end
