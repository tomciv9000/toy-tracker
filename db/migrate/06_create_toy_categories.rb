class CreateToyCategories < ActiveRecord::Migration
  def change
   create_table :toy_categories do |t|
     t.integer :toy_id
     t.integer :category_id
   end
 end
end
