require 'spec_helper'

RSpec.describe Surveyor::Response do
  subject { described_class.new(email: "chris.mcdonald.j@gmail.com") }
  let(:sample_question) { Surveyor::RatingQuestion.new(title: "How would you rate your experience") }

  it 'has a email' do
    expect(subject.email).to eq("chris.mcdonald.j@gmail.com")
  end

  it 'returns true for a valid answer for a rating question' do
    answer = Surveyor::Answer.new(
      question: sample_question,
      value: 5,
    )
    subject.add_answer(answer)
    expect(subject.answers).to include answer
  end

  it "returns false for a invalid answer for a rating question" do
    answer = Surveyor::Answer.new(
      question: sample_question,
      value: 10,
    )
    expect { subject.add_answer(answer) }.to raise_error RuntimeError
  end
end
