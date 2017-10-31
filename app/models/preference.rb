class Preference < ApplicationRecord
  before_save :set_rule_category

  def set_rule_category
    @rules = Rule.includes(:facts).all
    category = MatchingCategory.new(self.name, self.gender, self.marital_status, self.interest, @rules).matching_rule
    self.rule_category = category
  end
end
