require "spec_helper"
require 'apiify'

describe Apiify::Scaffolder do

  subject(:scaffolder) {described_class.new}
  let(:hash) {{:name => String, :colour => String, :weight_kgs => Float}}
  let(:csv_path) {"spec/fixtures/bunny.csv"}
  let(:not_a_csv) {"spec/fixtures/hare.txt"}

  it "can get file name" do
    expect(subject.get_file_name("bunny.csv")).to eq "bunny"
  end

  it "throws an error if you give it anything except a csv" do
    message = "Error: wrong file type. Please supply a .csv file"
    expect{ subject.get_file_name(not_a_csv) }.to raise_error(RuntimeError, message)
  end

  it "can find the header type" do
    expect(subject.find_class(csv_path)).to eq hash
  end

  it "converts the header and class hash to a string" do
    string = "name:string colour:string weight_kgs:float"
    expect(subject.hash_to_string(hash,nil)).to eq string
  end

  it "creates command to create scaffold based on csv file" do
    expect(subject.create_scaffold(csv_path, nil)).to eq "bin/rails g scaffold Bunny name:string colour:string weight_kgs:float"
  end

  context "index is provided" do
    it "adds index to the require column" do
      string = "name:string:index colour:string weight_kgs:float"
      expect(subject.hash_to_string(hash, "name")).to eq string
    end

    it "creates command to create scaffold with index" do
      expect(subject.create_scaffold(csv_path, "name")).to eq "bin/rails g scaffold Bunny name:string:index colour:string weight_kgs:float"
    end
  end

end
