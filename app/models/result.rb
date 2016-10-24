class Result < ApplicationRecord
  belongs_to :lesson
  belongs_to :answer
  belongs_to :word

  scope :count_correct_answer, -> do
    joins(:answer).where(answers: {is_correct: true}).size
  end
end
