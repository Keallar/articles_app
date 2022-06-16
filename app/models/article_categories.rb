class ArticleCategories < ApplicationRecord
  belongs_to :article, class_name: "article", foreign_key: "article_id"
  belongs_to :category, class_name: "category", foreign_key: "category_id"
end
