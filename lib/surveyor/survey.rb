module Surveyor
  class Survey
    attr_reader :name, :questions, :responses

    def initialize(name:)
      @name = name
      @questions = []
      @responses = []
    end

    def add_question(question)
      questions.push(question)
    end

    def add_response(response)
      responses.push(response)
    end

    def find_response(email)
      responses.find { |response| response.email == email }
    end

    def user_responded?(email)
      find_response(email) != nil
    end

    def answer_breakdown(question)
      results = responses
        .map { |response| response.answer_for_question(question) }
        .group_by(&:value)
        .map { |rating, answers| [rating, answers.count] }
        .to_h

      { 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0 }.merge(results)
    end
  end
end
