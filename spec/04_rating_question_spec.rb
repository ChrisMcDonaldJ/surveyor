require 'spec_helper'

RSpec.describe Surveyor::RatingQuestion do
  subject { described_class.new(title: "Hello World") }

  it 'has a title' do
    expect(subject.title).to eq("Hello World")
  end

  context 'valid_answer?' do
    it "is valid when rating is between 1 and 5" do
      (1..5).each do |rating|
        expect(subject.valid_answer?(rating)).to be true
      end
    end

    it "is invalid when rating is 6" do
      expect(subject.valid_answer?(6)).to be false
    end

    it "is invalid when rating is -1" do
      expect(subject.valid_answer?(-1)).to be false
    end
  end
end
