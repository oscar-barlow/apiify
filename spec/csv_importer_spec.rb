require "spec_helper"
require 'apiify'
require_relative '../lib/apiify/scaffolder'

describe Apiify::CsvImporter do

  subject(:csv_importer) {described_class.new}
  subject(:scaffolder) { Apiify::Scaffolder.new }
  let(:csv_path) {"spec/fixtures/bunny.csv"}

  it "runs rake task should call 'bin/rake import_csv'" do
    expect(csv_importer).to receive("system").with("bin/rake import_csv\[#{csv_path}\]")
    csv_importer.run_rake_task(csv_path)
  end

  it "outputs the message" do
    expect(STDOUT).to receive(:puts).with("11 records imported successfully.")
    csv_importer.output_message(csv_path)

  end


end
