class Apiify::Scaffolder

  def generate(csv_path)
    create_scaffold(csv_path)
    run_scaffold(csv_path)
    confirm(csv_path)
  end

  def get_file_name(csv_path)
    csv_path.split("/").last.split(".").first
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

  def hash_to_string(hash)
    output_str = ""
    hash.each do |key, value|
      output_str += "#{key}:#{value.to_s.downcase} "
    end
    output_str.strip
  end

  def create_scaffold(csv_path)
    model_name = get_file_name(csv_path).capitalize
    hash_result = find_class(csv_path)
    "bin/rails g scaffold #{model_name} #{hash_to_string(hash_result)}"
  end

  def run_scaffold(csv_path)
    system(create_scaffold(csv_path))
  end

  def confirm(csv_path)
    puts "Created #{get_file_name(csv_path).capitalize} model with properties #{hash_to_string(find_class(csv_path))}"
    puts "Please run `bin/rake db:migrate`"
  end


end
