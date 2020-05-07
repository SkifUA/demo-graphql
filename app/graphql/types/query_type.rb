module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :user, Types::UserType, null: true, description: "One User" do
      argument :id, ID, required: true
    end

    def user(id:)
      # Rails.logger.info("[User] #{context.inspect}")
      User.find_by_id(id)
    end
  end
end
