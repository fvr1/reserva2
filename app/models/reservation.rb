class Reservation < ApplicationRecord
  enum status: [:waiting_confirmation, :confirmed, :cancelled]
end
