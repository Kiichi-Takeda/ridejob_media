class Article < ApplicationRecord
  has_many :article_taggings, dependent: :destroy
  has_many :article_specific_tags, through: :article_taggings

  has_one_attached :image

  validates :title, :category, :content, :published_at, presence: true
end
