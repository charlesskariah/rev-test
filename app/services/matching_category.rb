require 'wongi-engine'
include Wongi::Engine::DSL
class MatchingCategory

  def initialize(name, gender, marital_status, interest, our_rules)
    @name = name
    @gender = gender
    @marital_status = marital_status
    @interest = interest
    @rules = our_rules
    @engine = Wongi::Engine.create
    push_to_engine
    rules

  end
  
  def rules
    @rules.each do |rule|
      rule_maker(rule, rule.facts)
    end
  end

  def rule_maker(rule, facts)
    @engine.rule "#{rule.name}" do
      forall {
        facts.each do |fact|
          has fact.subject.to_sym, fact.predicate.to_sym, fact.object
        end
      }
    end
  end

  def push_to_engine
    @engine << [@name, :gender, @gender ]
    @engine << [@name, :marital_status, @marital_status ]
    @engine << [@name, :interest, @interest ]
  end

  def rule_list
    @rules.map{|rule| rule.name }
  end

  def matching_rule
    rule_list.each do |list|
      @engine.productions[list].tokens.each do |token|
        return list
      end
    end
  end
end
