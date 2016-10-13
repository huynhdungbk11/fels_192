class Category < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_many :words, dependent: :destroy
  scope :update_desc, -> {order(updated_at: :desc)}

  validates :name, presence: true, length: {maximum: 140}
  has_attached_file :category_img, styles: { category_index: "250x200", category_show: "400x350" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :category_img, content_type: /\Aimage\/.*\z/

  class << self
    def search search
      where("name LIKE ?", "%#{search}%").update_desc
    end
  end
end
