class Resource < ApplicationRecord
  belongs_to :company
  has_many :state
end
