class AddRuleCategoryToPreference < ActiveRecord::Migration[5.1]
  def change
    add_column :preferences, :rule_category, :string
  end
end
