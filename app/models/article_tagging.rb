class ArticleTagging < ApplicationRecord
  belongs_to :article
  belongs_to :article_specific_tag
end
