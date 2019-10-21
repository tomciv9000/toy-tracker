class CreateToys < ActiveRecord::Migration
  def change
    create_table :toys do |t|
      t.string :name
      t.integer :kid_id
      t.integer :stage_id

      t.timestamps null: false
    end
  end
end
