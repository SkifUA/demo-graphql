class Types::MutationType < Types::BaseObject

  field :create_user, Types::UserType, mutation: Mutations::CreateUser

  field :login, mutation: Mutations::User::Login

  field :logout, mutation: Mutations::User::Logout

  field :update_user, Boolean, null: false, description: "Update an user" do
    argument :user, Types::UserInputType, required: true
  end

  def update_user(user:)
    existing = User.find_by_id(user[:id])
    existing&.update(user.to_h)
  end

  field :delete_user, Boolean, null: false, description: "Delete an user"do
    argument :id, ID, required: true
  end

  def delete_user(id:)
    User.where(id: id).destroy_all
    true
  end
end

