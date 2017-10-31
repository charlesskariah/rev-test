class Rule < ApplicationRecord
  has_many :facts, dependent: :destroy
  accepts_nested_attributes_for :facts

  def self.rule_for_engine(rule)
    format = "rule #{rule.name} do |s|
      #{rule.rule_type} {}
    end "
    return JSON[format]
  end

  def self.create_facts_for_engine(facts)
    value = ""
    facts.each do |fact|
      value += "#{ fact.matcher + " " +  fact.subject + ", " + fact.predicate + ", " + fact.object + "/n " }"
    end
    value
  end

  def self.looped_facts(facts)
  end
end

#rule "sanguine" do
#   forall {
#     has :A, :gender, :male
#     has :A, :marital_status, :single
#     has :A, :interest, "active"
#   }
# end