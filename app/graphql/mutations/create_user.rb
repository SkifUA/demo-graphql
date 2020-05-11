class Mutations::CreateUser < Mutations::BaseMutation
  null true

  argument :user, Types::UserInputType, required: true

  def resolve(user:)
    User.create(user.to_h)
  end
end