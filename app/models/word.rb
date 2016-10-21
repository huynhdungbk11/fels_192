class Word < ApplicationRecord
  belongs_to :category
  has_many :lessons, through: :result
  has_many :answer, dependent: :destroy
  has_many :results

  scope :order_name, ->{order :name}
  scope :of_category, ->category_id {where category_id: category_id}
  scope :search_name, ->search do
    where("name LIKE ?", "%#{search}%") if search.present?
  end
  scope :random, -> do
    order("RANDOM()").limit Settings.per_lesson.words
  end
end
