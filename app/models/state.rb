class State < ApplicationRecord
  enum type: [:vacation, :never_available, :reservation]
end
