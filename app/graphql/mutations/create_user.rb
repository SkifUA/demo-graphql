class Mutations::CreateUser < GraphQL::Schema::Mutation
  null true

  argument :email, String, required: false
  argument :name, String, required: false

  def resolve(email:, name:)
    User.create(email: email, name: name)
  end
end