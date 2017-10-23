class Item < ApplicationRecord
  belongs_to :room
  belongs_to :receipt, optional: true
end
