class CreateArticleTaggings < ActiveRecord::Migration[8.0]
  def change
    create_table :article_taggings do |t|
      t.references :article, null: false, foreign_key: true
      t.references :article_specific_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
