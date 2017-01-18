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

end
