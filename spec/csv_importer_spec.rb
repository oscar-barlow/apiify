require "spec_helper"
require 'apiify'
require_relative '../scaffolder'

describe Apiify::CsvImporter do

  subject(:csv_importer) {described_class.new}
  subject(:scaffolder) { Apiify::Scaffolder.new }
  let(:csv_path) {"fixtures/bunny.csv"}

  it "returns the filename of the csv file" do
    expect(csv_importer.get_file_name(csv_path)).to eq("bunny")
  end
  # 
  # it "creates a new record for every line in CSV file" do
  #   exec(scaffolder.create_scaffold(csv_path))
  #   expect { csv_importer.import_csv }.to change {Bunny.count}.by 12
  # end



end
