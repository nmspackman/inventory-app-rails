class Room < ApplicationRecord
  belongs_to :property, dependent: :destroy
  has_many :items
end
