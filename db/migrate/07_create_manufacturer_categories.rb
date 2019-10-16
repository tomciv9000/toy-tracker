class CreateManufacturerCategories < ActiveRecord::Migration
  def change
   create_table :manufacturer_categories do |t|
     t.integer :manufacturer_id
     t.integer :category_id
   end
 end
end
