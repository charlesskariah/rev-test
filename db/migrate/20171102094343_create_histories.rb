class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.text :content
      t.string :content_type
      t.boolean :is_user
      t.integer :user_id

      t.timestamps
    end
  end
end
