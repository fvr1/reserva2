class Company < ApplicationRecord
  has_many :blocks
  has_many :resources
end
