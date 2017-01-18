class Apiify::Scaffolder

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

end
