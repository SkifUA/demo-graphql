module Mutations
  module User
    class Login < Mutations::BaseMutation
      null true

      argument :input, Types::Inputs::UserLogin, required: true

      def resolve(input:)
        if (user = ::User.find_by_email(input.email)&.authenticate(input.password))
          payload = { user_id: user.id }

          session = JWTSessions::Session.new(
              payload: payload,
              refresh_payload: payload
          )
          session.login
        else
          raise GraphQL::ExecutionError, "Login error"
        end
      end

    end
  end
end