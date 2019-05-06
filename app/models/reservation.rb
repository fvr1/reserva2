class Reservation < ApplicationRecord
  enum status: [:waiting_confirmation, :confirmed, :cancelled]
  belongs_to :state
end
