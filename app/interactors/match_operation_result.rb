class MatchOperationResult < ApplicationInteractor
  delegate :_context,         to: :context
  delegate :operation_result, to: :context

  def call

  end

  def validation
    context.fail!(message: "operation_result.failure") if operation_result.blank?
  end
end