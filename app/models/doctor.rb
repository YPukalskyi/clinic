class Doctor < ApplicationRecord
  belongs_to :user
  
  has_many :appointments
  has_many :users, through: :appointments
  has_and_belongs_to_many :categories
end
