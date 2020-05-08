class Types::UserInputType < GraphQL::Schema::InputObject
  graphql_name "UserInputType"
  description "User's Attributes for create"

  argument :id, ID, required: false
  argument :email, String, required: false
  argument :name, String, required: false
end

class Types::UserType < Types::BaseObject
  description 'An User'

  field :id, ID, null: false
  field :email, String, null: false
  field :name, String, null: true
end