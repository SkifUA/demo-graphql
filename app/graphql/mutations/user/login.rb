module Mutations
  module User
    class Login < Mutations::BaseMutation
      null true
      type Types::AuthTokenType

      argument :input, Types::Inputs::UserLogin, required: true

      def resolve(input:)
        operation_result = UserInteractors::Login.call(input: input)
        if operation_result.success?
          operation_result.result
        else
          raise GraphQL::ExecutionError, "Login error"
        end
      end

    end
  end
end