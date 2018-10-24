module Surveyor
  class FreeTextQuestion < Question
    def valid_answer?(value)
      value.is_a?(String)
    end
  end
end
