# frozen_string_literal: true

class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.text :title
      t.references :taggable, polymorphic: true
      t.timestamps
    end
  end
end
