class Block < ApplicationRecord
  enum day: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
  has_many :states
  belongs_to :company
end
