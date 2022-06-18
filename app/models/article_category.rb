class ArticleCategory < ApplicationRecord
  belongs_to :article, foreign_key: 'article_id' 
  belongs_to :category, foreign_key: 'category_id'
end
