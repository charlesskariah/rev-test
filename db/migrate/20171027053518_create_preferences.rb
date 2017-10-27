class CreatePreferences < ActiveRecord::Migration[5.1]
  def change
    create_table :preferences do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :marital_status
      t.string :interest

      t.timestamps
    end
  end
end
