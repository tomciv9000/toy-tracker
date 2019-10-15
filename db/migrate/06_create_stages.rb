class CreateStages < ActiveRecord::Migration
  def change
   create_table :stages do |t|
     t.string :name
   end
 end
end
