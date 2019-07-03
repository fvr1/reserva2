class Resource < ApplicationRecord
  belongs_to :company
  has_many :states
end
