class CreateArticleSpecificTags < ActiveRecord::Migration[8.0]
  def change
    create_table :article_specific_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
