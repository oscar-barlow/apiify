require "spec_helper"
require 'apiify'
require_relative '../lib/apiify/scaffolder'

describe Apiify::CsvImporter do

  subject(:csv_importer) {described_class.new}
  subject(:scaffolder) { Apiify::Scaffolder.new }
  let(:csv_path) {"fixtures/bunny.csv"}

  # it "returns the filename of the csv file" do
  #   expect(csv_importer.get_file_name(csv_path)).to eq("bunny")
  # end




end
