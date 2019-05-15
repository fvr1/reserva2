class State < ApplicationRecord
  enum category: [:vacation, :never_available, :reservation]
  belongs_to :block
  belongs_to :resource
  has_one :reservation

  accepts_nested_attributes_for :reservation
end
