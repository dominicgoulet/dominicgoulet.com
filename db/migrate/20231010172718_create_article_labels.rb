# frozen_string_literal: true

class CreateArticleLabels < ActiveRecord::Migration[7.0]
  def change
    create_table :article_labels do |t|
      t.references :article, null: false, foreign_key: true
      t.references :label, null: false, foreign_key: true

      t.timestamps
    end
  end
end
