require "apiify/version"
require 'apiify/csv_converter'
require 'apiify/scaffolder'
require 'apiify/csv_importer'
require 'CSV'

module Apiify

  def get_file_name(csv_path)
    csv_path.split("/").last.split(".").first
  end

end
