module Types
  module Inputs
    class UserLogin < Types::BaseInputObject
      graphql_name 'UserLogin'
      description 'Input Login User'

      argument :email,
               String,
               required: true,
               description: "User's email",
               prepare: ->(v, _ctx) { v.strip }

      argument :password,
               String,
               required: true,
               description: "User's password"
    end
  end
end