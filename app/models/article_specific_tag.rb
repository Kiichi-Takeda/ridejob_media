class ArticleSpecificTag < ApplicationRecord
  has_many :article_taggings, dependent: :destroy
  has_many :articles, through: :article_taggings

  validates :name, presence: true
end
