class CreateNudges < ActiveRecord::Migration[5.1]
  def change
    create_table :nudges do |t|
      t.string :name
      t.integer :category_id
      t.string :nudge_type
      t.integer :category_id
      t.text :content

      t.timestamps
    end
  end
end
