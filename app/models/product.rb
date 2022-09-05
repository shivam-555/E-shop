class Product < ApplicationRecord
	serialize :image, JSON
	belongs_to :user, optional: true
	mount_uploader :image, ImageUploader

	validates :title, :brand, :price, :model, presence: true
	validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum aloud. " }
	validates :title, length: { maximum: 140, too_long: "%{count} characters is the maximum aloud. " }
	validates :price, numericality: { only_integer: true }, length: { maximum: 7 }

	BRAND = %W{ Calvin Klein Flying Machine H&M Levi’s Louis Philippe Mufti Pepe Jeans Peter England Park Avenue United Colors of Benetton }
	FINISH = %w{ Black White Navy Blue Red Clear Satin Yellow Seafoam }
	CONDITION = %W{ New Excellent Mint Used Fair Poor }
end
