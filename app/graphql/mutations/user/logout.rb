module Mutations
  module User
    class Logout < Mutations::BaseMutation
      null true

      type Boolean

      def resolve
        session = JWTSessions::Session.new
        session.flush_by_token(context[:found_refresh_token])
      end
    end
  end
end