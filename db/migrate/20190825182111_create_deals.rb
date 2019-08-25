# frozen_string_literal: true

class CreateDeals < ActiveRecord::Migration[5.2]
  def change
    create_table :deals do |t|
      t.integer :external_id, null: false
      t.string :name, null: false
      t.float :value, null: false
      t.integer :deal_stage_id, null: false
      t.integer :deal_stage_percentage, null: false
      t.string :deal_stage_name, null: false

      t.timestamps
    end

    add_index :deals, :external_id, unique: true
  end
end
