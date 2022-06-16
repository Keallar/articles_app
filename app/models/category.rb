class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories

  validates_uniqueness_of :name, on: :create, message: 'must be unique'
  validates :name, length: { minimum: 3, maximum: 20 }
end
