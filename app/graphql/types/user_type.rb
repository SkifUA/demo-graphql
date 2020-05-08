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

  field :errors, [Types::ErrorType], null: true

  def errors
    object.errors.map { |e| { field_name: e, errors: object.errors[e] } }
  end

  def self.authorized?(object, context)
    !!context[:current_user]
  end

  # def self.visible?(context)
  #   !!context[:current_user]
  # end
end