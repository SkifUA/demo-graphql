module Mutations
  class BaseMutation < GraphQL::Schema::Mutation

    def refresh_token_payload
      context[:refresh_token_payload]
    end

    def refresh_token
      context[:found_refresh_token]
    end

    def current_user
      context[:current_user]
    end
  end
end
