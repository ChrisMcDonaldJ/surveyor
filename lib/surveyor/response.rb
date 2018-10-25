module Surveyor
  class Response
    attr_reader :email, :answers

    def initialize(email:, answers: [])
      @email = email
      @answers = answers
    end

    def add_answer(answer)
      raise "Invalid Answer" unless answer.valid?

      answers.push(answer)
    end

    def answer_for_question(question)
      answers.find { |answer| answer.question == question }
    end
  end
end
