class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :company

  before_validation :create_company

  private

  def create_company
    return unless company.nil?

    self.company = Company.create(name: 'Unnamed company')
  end
end
