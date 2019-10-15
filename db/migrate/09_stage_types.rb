class StageTypes < ActiveRecord::Migration
  def change
   create_table :stage_types do |t|
     t.integer :stage_id
     t.integer :type_id
   end
 end
end
