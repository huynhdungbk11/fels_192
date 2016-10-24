class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :results, dependent: :destroy
  accepts_nested_attributes_for :results

  scope :update_desc, ->{order updated_at: :desc}

  validate :validate_results

  before_create :create_words_for_lesson

  private
  def create_words_for_lesson
    words = Word.of_category(self.category.id).random
    words.each do |word|
      self.results.build word_id: word.id
    end
  end

  def validate_results
    results = self.results
    results.each do |result|
      if result.answer_id.nil?
        errors.add :subjects, I18n.t("isnt_finish_lesson")
        break
      end
    end
  end
end
