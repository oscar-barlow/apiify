require "spec_helper"
require 'apiify'

describe Apiify::Scaffolder do

  subject(:scaffolder) {described_class.new}
  let(:hash) {{:name => String, :colour => String, :weight_kgs => Float}}
  let(:csv_path) {"spec/fixtures/bunny.csv"}

  it "can get file name" do
    expect(subject.get_file_name("bunny.csv")).to eq "bunny"
  end

  it "can find the header type" do
    expect(subject.find_class(csv_path)).to eq hash
  end

  it "converts the header and class hash to a string" do
    string = "name:string colour:string weight_kgs:float"
    expect(subject.hash_to_string(hash)).to eq string
  end

  it "creates command to create scaffold based on csv file" do
    expect(subject.create_scaffold(csv_path)).to eq "bin/rails g scaffold Bunny name:string colour:string weight_kgs:float"
  end

end
