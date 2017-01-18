require "spec_helper"
require 'apiify'

describe Apiify::CsvImporter do

  subject(:csv_importer) {described_class.new}
  let(:csv_path) {"fixtures/bunny.csv"}

  it "returns the filename of the csv file" do
    expect(subject.get_file_name(csv_path)).to eq("bunny")
  end



end
