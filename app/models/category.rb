class Category < ApplicationRecord
  validates_uniqueness_of :name, on: :create, message: 'must be unique'
  validates :name, length: { minimum: 3, maximum: 20 }
end
