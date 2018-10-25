module Surveyor
  class Response
    attr_reader :email, :answers, :tags

    def initialize(email:, answers: [], tags: [])
      @email = email
      @answers = answers
      @tags = tags
    end

    def add_answer(answer)
      raise "Invalid Answer" unless answer.valid?

      answers.push(answer)
    end

    def answer_for_question(question)
      answers.find { |answer| answer.question == question }
    end

    def contains_tags?(array)
      array.all? { |value| tags.include?(value) }
    end
  end
end
