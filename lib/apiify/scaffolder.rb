class Apiify::Scaffolder

  def generate(csv_path, index_col)
    run_scaffold(csv_path, index_col)
    confirm(csv_path, index_col)
  end

  def get_file_name(csv_path)
    if is_a_csv?(csv_path)
      get_file(csv_path).first
    else
      raise "Error: wrong file type. Please supply a .csv file"
    end
  end

  def find_class(path)
    table = CSV.table(path)
    headers = table.headers
    result = {}
    headers.each do |header|
      table.each do |row|
        if row[header].class != Float
          result[header] = row[header].class
        else
          result[header] = row[header].class
          break
        end
      end
    end
    result
  end

  def hash_to_string(hash, index_col)
    output_str = ""
    hash.each do |key, value|
      if !index_col.nil? && key.to_s == index_col
        output_str += "#{key}:#{value.to_s.downcase}:index "
      else
        output_str += "#{key}:#{value.to_s.downcase} "
      end
    end
    output_str.strip
  end

  def create_scaffold(csv_path, index_col)
    model_name = get_file_name(csv_path).capitalize
    hash_result = find_class(csv_path)
    "bin/rails g scaffold #{model_name} #{hash_to_string(hash_result, index_col)}"
  end

  def run_scaffold(csv_path, index_col)
    system(create_scaffold(csv_path, index_col))
  end

  def confirm(csv_path, index_col)
    puts "Created #{get_file_name(csv_path).capitalize} model with properties #{hash_to_string(find_class(csv_path),index_col)}"
    puts "Please run `bin/rake db:migrate`"
  end

  private

  def is_a_csv?(csv_path)
    get_file(csv_path).last == "csv"
  end

  def get_file(csv_path)
    csv_path.split("/").last.split(".")
  end

end
