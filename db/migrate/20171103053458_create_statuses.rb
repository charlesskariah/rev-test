class CreateStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :statuses do |t|
      t.integer :pattern_id
      t.integer :current_parent_id
      t.integer :current_question_id
      t.integer :user_id

      t.timestamps
    end
  end
end
