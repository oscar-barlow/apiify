

  class Apiify::CsvConverter
    def self.test
      "Hello"
    end

    def self.get_file_name(csv_path)
      csv_path.split("/").last.split(".").first
    end

  end
