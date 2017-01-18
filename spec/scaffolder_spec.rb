require "spec_helper"
require 'apiify'

describe Apiify::Scaffolder do

  subject(:scaffolder) {described_class.new}

  it "can find the header type" do
    expect(subject.find_class("spec/fixtures/bunny.csv")).to eq ({:name => String, :colour => String, :weight_kgs => Float})
  end

end
