class CreateKids < ActiveRecord::Migration
  def change
    create_table :kids do |t|
      t.string :name
      t.integer :user_id
      t.integer :stage_id

      t.timestamps null: false
    end
  end
end
