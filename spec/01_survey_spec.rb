require 'spec_helper'

RSpec.describe Surveyor::Survey do
  subject { described_class.new(name: "Engagement Survey") }
  let(:response) { Surveyor::Response.new(email: "chris.mcdonald.j@gmail.com") }
  let(:sample_question) { Surveyor::RatingQuestion.new(title: "How would you rate your experience") }

  it "has a name" do
    expect(subject.name).to eq("Engagement Survey")
  end

  it "can have questions added" do
    question = double(:question)
    subject.add_question(question)
    expect(subject.questions).to include(question)
  end

  it "can have responses added" do
    response = double(:response)
    subject.add_response(response)
    expect(subject.responses).to include(response)
  end

  it "can find response by email" do
    subject.add_response(response)
    expect(subject.find_response(response.email)).to eq(response)
  end

  it "can return nil for a user who hasn't responded" do
    expect(subject.find_response("cmcd0003@student.monash.edu")).to eq nil
  end

  it "can return true if a response exists by email" do
    subject.add_response(response)
    expect(subject.user_responded?(response.email)).to be true
  end

  it "can return false if a response does not exist by email" do
    expect(subject.user_responded?("cmcd0003@student.monash.edu")).to be false
  end

  context "answer_breakdown" do
    let(:response_alternative) { Surveyor::Response.new(email: "cmcd0003@student.monash.edu") }
    let(:answer_1) { Surveyor::Answer.new(question: sample_question, value: 1) }
    let(:answer_5) { Surveyor::Answer.new(question: sample_question, value: 5) }

    before do
      response.add_answer(answer_1)
      response_alternative.add_answer(answer_5)

      subject.add_response(response)
      subject.add_response(response_alternative)
    end

    it 'returns a breakdown of a rating question' do
      expect(subject.answer_breakdown(sample_question)).to eq(
        1 => 1,
        2 => 0,
        3 => 0,
        4 => 0,
        5 => 1,
      )
    end
  end
end
