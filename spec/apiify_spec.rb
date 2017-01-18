require "spec_helper"
require 'apiify'


describe Apiify::CsvConverter do
  it "returns hello" do
    expect(Apiify::CsvConverter.test()).to eq("Hello")
  end

  it "returns the filename of the csv file" do
    csv_path = "fixtures/bunny.csv"
    expect(Apiify::CsvConverter.get_file_name(csv_path)).to eq("bunny")
  end

end
