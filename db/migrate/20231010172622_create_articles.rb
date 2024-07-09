# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :body
      t.string :slug
      t.date :published_on

      t.timestamps
    end
  end
end
