class CreateStageCategories < ActiveRecord::Migration
  def change
   create_table :stage_categories do |t|
     t.integer :stage_id
     t.integer :category_id
   end
 end
end
