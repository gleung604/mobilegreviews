class AddScoreToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :score, :integer
  end
end
