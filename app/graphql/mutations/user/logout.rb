module Mutations
  module User
    class Logout < Mutations::BaseMutation
      null true

      type Boolean

      def resolve
        operation_result = UserInteractors::Logout.call(refresh_token: refresh_token)
        if operation_result.success?
          true
        else
          raise GraphQL::ExecutionError, "Login error"
        end
      end
    end
  end
end