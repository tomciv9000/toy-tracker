class CreateManufacturerTypes < ActiveRecord::Migration
  def change
   create_table :manufacturer_types do |t|
     t.integer :manufacturer_id
     t.integer :type_id
   end
 end
end
