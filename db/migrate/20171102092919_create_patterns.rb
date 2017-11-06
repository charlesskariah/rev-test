class CreatePatterns < ActiveRecord::Migration[5.1]
  def change
    create_table :patterns do |t|
      t.string :name
      t.integer :max_priority
      
      t.timestamps
    end
  end
end
