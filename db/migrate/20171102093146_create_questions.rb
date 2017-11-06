class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :content
      t.boolean :branching
      t.boolean :parent
      t.string :question_type

      t.timestamps
    end
  end
end
