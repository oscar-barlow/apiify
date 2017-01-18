require "spec_helper"
require 'apiify'

describe Apiify::Scaffolder do

  subject(:scaffolder) {described_class.new}
  let(:hash) {{:name => String, :colour => String, :weight_kgs => Float}}

  it "can find the header type" do
    expect(subject.find_class("spec/fixtures/bunny.csv")).to eq hash
  end

  it "converts the header and class hash to a string" do
    string = "name:string colour:string weight_kgs:float"
    expect(subject.hash_to_string(hash)).to eq string
  end

end
