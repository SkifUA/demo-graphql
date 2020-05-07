class Types::UserType < Types::BaseObject
  description 'An User'

  field :id, ID, null: false
  field :email, String, null: false
  field :name, String, null: true

end