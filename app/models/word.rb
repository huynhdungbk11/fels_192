class Word < ApplicationRecord
  belongs_to :category
  scope :order_name, ->{order :name}
  scope :search_name, ->search do
    where("name LIKE ?", "%#{search}%") if search.present?
  end
end
