module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :user, Types::UserType, null: true, description: "One User" do
      argument :id, ID, required: true
    end

    def user(id:)
      # Rails.logger.info("[User] #{context.inspect}")
      _user = User.find_by_id(id)
      return _user if _user.presence
      raise GraphQL::ExecutionError, "Not found"
    end


    field :users, [Types::UserType], null: false, description: "Users List"

    def users
      User.all
    end


    field :current_user, Types::UserType, null: true, description: "The current User"

    def current_user
      context[:current_user]
    end

    field :logout, Boolean, null: false

  end
end
