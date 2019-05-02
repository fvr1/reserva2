class Block < ApplicationRecord
  enum day: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
end
