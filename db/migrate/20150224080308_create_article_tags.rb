class CreateArticleTags < ActiveRecord::Migration
  def change
    create_table :article_tags do |t|
      t.references :article, index: true
      t.references :tag, index: true

      t.timestamps null: false
    end
    add_foreign_key :article_tags, :articles
    add_foreign_key :article_tags, :tags
  end
end
