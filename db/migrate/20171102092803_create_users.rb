class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :user_name
      t.integer :category_id
      t.boolean :active
      t.boolean :guest

      t.timestamps
    end
  end
end
