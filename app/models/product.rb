class Product < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  belongs_to :user, optional: true
  has_many :line_items
  mount_uploader :image, ImageUploader
  serialize :image, JSON

  validates :title, :brand, :price, :model, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum aloud. " }
  validates :title, length: { maximum: 140, too_long: "%{count} characters is the maximum aloud. " }
  validates :price, length: { maximum: 7 }

  BRAND = %W{ Calvin Klein Flying Machine H&M Levi’s Louis Philippe Mufti Pepe Jeans Peter England Park Avenue United Colors of Benetton }
  FINISH = %w{ Black White Navy Blue Red Clear Satin Yellow Seafoam }
  CONDITION = %W{ New Excellent Mint Used Fair Poor }

  private

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end
end
