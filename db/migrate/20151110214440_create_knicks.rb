class CreateKnicks < ActiveRecord::Migration
  def change
    create_table :knicks do |t|
      t.string :name, null: false
      t.integer :jersey_number, null: false
      t.string :position, null: false

      t.timestamps(null: false)
    end
  end
end

