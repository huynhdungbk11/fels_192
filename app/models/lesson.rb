class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :results, dependent: :destroy
  accepts_nested_attributes_for :results

  scope :update_desc, ->{order updated_at: :desc}

  validate :validate_results

  before_create :create_words_for_lesson
  after_create :create_lesson_activity
  after_update :update_lesson_activity

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

  def update_lesson_activity
    lesson = Activity.find_by target_id: id, action_type: 0
    if lesson
      Activity.create user_id: user_id, target_id: id,
        action_type: 1, target_type: 0
    end
  end

  def create_lesson_activity
    Activity.create user_id: user_id, target_id: id,
      action_type: 0, target_type: 0
  end
end
