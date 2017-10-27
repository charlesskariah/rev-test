class Preference < ApplicationRecord
  after_create :set_rule_category

  def set_rule_category
    category = MatchingCategory.new(self.name, self.gender, self.marital_status, self.interest).matching_rule
    self.rule_category = category
    self.save
  end
end
