class NextQuestion
  def initialize(pattern, current_priority = 0, current_question = nil, option = nil)
    @pattern = pattern
    @current_priority = current_priority
    @current_question = current_question
    @option = option 
  end

  def find_next_question
    if @current_question.present? && traversing?
      if @current_question.branching && @current_question.parent
        next_question = Question.where(id: @option.next_question_id).first
        set_status(next_question)
        next_question
      elsif @current_question.branching && !@current_question.parent
        next_question = Question.where(id: @option.next_question_id)
      elsif !@current_question.branching && @current_question.parent
        next_priority = @pattern.next_priority(@current_priority)
        next_question = @pattern.next_question(next_priority)
        set_status(next_question)
        next_question
      elsif !@current_question.branching && !@current_question.parent
        current_parent_id = current_user.status.first.current_parent_id
        @current_priority = @pattern.pattern_questions.where(question_id: current_parent_id).first.priority
        find_question_from_pattern
      end
    elsif @current_question.nil?
      find_question_from_pattern
    elsif @current_question.present? && !traversing?
      nil
    end
  end

  def set_status(next_question)
    parent_id = next_question.id if next_question.parent
    if parent_id.present?
      Status
        .find_or_initialize_by(user_id: current_user.id)
        .update_attributes!(pattern_id: @pattern.id, current_question_id: next_question.id, current_parent_id: next_question.id)
    else
      Status
        .find_or_initialize_by(user_id: current_user.id)
        .update_attributes!(pattern_id: @pattern.id, current_question_id: next_question.id)
    end
  end

  def find_question_from_pattern
    next_priority = @pattern.next_priority(@current_priority)
    next_question = @pattern.next_question(next_priority)
    set_status(next_question)
    next_question
  end

  def traversing?
    current_parent_id = current_user.status.first.current_parent_id
    count = @pattern.pattern_questions.where(question_id: current_parent_id).first.priority
    if count == @pattern.max_priority
      false
    elsif count < @pattern.max_priority
      true
    end
  end

  def current_user
    User.first
  end
end