class Article < ApplicationRecord
  has_many :article_taggings, dependent: :destroy
  has_many :article_specific_tags, through: :article_taggings

  has_one_attached :image

  validates :title, :category, :content, :published_at, presence: true

  # Ransackの検索対象属性を明示的に指定
  def self.ransackable_attributes(auth_object = nil)
    ["category", "content", "created_at", "id", "published_at", "title", "updated_at"]
  end

  # Ransackの関連モデルを検索対象にする場合
  def self.ransackable_associations(auth_object = nil)
    ["article_specific_tags"]
  end
end
