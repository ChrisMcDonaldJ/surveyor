require 'spec_helper'

RSpec.describe Surveyor::Answer do
  let(:sample_question) { Surveyor::Question.new(title: "How would you rate your experience") }
  let(:answer) { Surveyor::Answer.new(question: sample_question, value: 5) }

  it "has a question" do
    expect(answer.question).to be(sample_question)
  end

  it "has the correct value" do
    expect(answer.value).to eq(5)
  end
end
