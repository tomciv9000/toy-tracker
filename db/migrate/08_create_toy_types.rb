class CreateToyTypes < ActiveRecord::Migration
  def change
   create_table :toy_types do |t|
     t.integer :toy_id
     t.integer :type_id
   end
 end
end
