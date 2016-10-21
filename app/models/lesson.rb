class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :results, dependent: :destroy
  accepts_nested_attributes_for :results

  scope :update_desc, ->{order updated_at: :desc}

  before_create :create_words_for_lesson

  private
  def create_words_for_lesson
    words = Word.of_category(self.category.id).random
    words.each do |word|
      self.results.build word_id: word.id
    end
  end
end
