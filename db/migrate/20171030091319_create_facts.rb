class CreateFacts < ActiveRecord::Migration[5.1]
  def change
    create_table :facts do |t|
      t.string :matcher
      t.string :subject
      t.string :predicate
      t.string :object
      t.integer :rule_id

      t.timestamps
    end
  end
end
