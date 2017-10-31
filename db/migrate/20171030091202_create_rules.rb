class CreateRules < ActiveRecord::Migration[5.1]
  def change
    create_table :rules do |t|
      t.string :name
      t.string :rule_type

      t.timestamps
    end
  end
end
