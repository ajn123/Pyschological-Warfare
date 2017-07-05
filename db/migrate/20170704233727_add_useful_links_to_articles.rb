class AddUsefulLinksToArticles < ActiveRecord::Migration[5.1]
  def change
  	add_column :articles, :useful_links, :text
  	add_column :articles, :people_mentioned, :text
  end
end
