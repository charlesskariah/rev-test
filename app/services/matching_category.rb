require 'wongi-engine'
include Wongi::Engine::DSL
class MatchingCategory

  def initialize(name, gender, marital_status, interest)
    @name = name
    @gender = gender
    @marital_status = marital_status
    @interest = interest
    @engine = Wongi::Engine.create
    push_to_engine
    rules
  end
  

  def push_to_engine
    @engine << [@name, :gender, @gender.to_sym ]
    @engine << [@name, :marital_status, @marital_status.to_sym ]
    @engine << [@name, :interest, @interest ]
  end

  def rule_list
   return ["sanguine", "choleric", "melancholic", "phlegmatic"]
  end

  def rules
    @engine.rule "sanguine" do
        forall {
          has :A, :gender, :male
          has :A, :marital_status, :single
          has :A, :interest, "active"
        }
    end

    @engine.rule "choleric" do
        forall {
          has :A, :gender, :male
          has :A, :marital_status, :married
          has :A, :interest, "short-tempered"
        }
    end

    @engine.rule "melancholic" do
        forall {
          has :A, :gender, :male
          has :A, :marital_status, :married
          has :A, :interest, "quiet"
        }
    end

    @engine.rule "phlegmatic" do
        forall {
          has :A, :gender, :male
          has :A, :marital_status, :married
          has :A, :interest, "relaxed"
        }
    end
  end

  def matching_rule
    rule_list.each do |list|
      @engine.productions[list].tokens.each do |token|
        return list
      end
    end
  end
end
