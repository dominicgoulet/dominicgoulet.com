# frozen_string_literal: true

class CreateSocialLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :social_links do |t|
      t.string :caption
      t.string :href
      t.string :svg_path

      t.timestamps
    end
  end
end
