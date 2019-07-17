# frozen_string_literal: true

class AddUsefulLinksToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :useful_links, :text
    add_column :articles, :people_mentioned, :text
    add_column :articles, :timestamp, :text
    add_column :articles, :embedded_link, :text
  end
end
