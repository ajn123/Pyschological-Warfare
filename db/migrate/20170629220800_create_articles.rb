# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :author, default: 'A.J. Norton'
      t.boolean :published, default: false
      t.date :written_at_date
      t.string :header_image, default: 'logo.png'
      t.integer :user_id

      t.timestamps
    end
  end
end
