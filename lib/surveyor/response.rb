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
  end
end
