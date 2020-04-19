# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false, limit: 45
      t.text :body, null: false, limit: 140
      t.timestamps
    end
  end
end
