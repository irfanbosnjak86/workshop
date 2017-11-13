class Item < ApplicationRecord
  belongs_to :workshop
  has_many :repairs
end
