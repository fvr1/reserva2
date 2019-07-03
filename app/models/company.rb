class Company < ApplicationRecord
  has_many :blocks
  has_many :resources
  has_many :users
end
