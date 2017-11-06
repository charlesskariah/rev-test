class CreatePatternQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :pattern_questions do |t|
      t.integer :pattern_id
      t.integer :question_id
      t.integer :priority

      t.timestamps
    end
  end
end
