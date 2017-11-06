class CreateUserAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :user_answers do |t|
      t.integer :question_id
      t.integer :user_id
      t.text :answer
      t.string :question_type

      t.timestamps
    end
  end
end
