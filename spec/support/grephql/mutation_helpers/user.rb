module Graphql
  module MutationHelpers
    def crate_user_mutation
      %(
        mutation createUser($user:UserInputType!) {
          createUser(user: $user) {
            email
            name
            errors {
              field_name
              errors
            }
          }
        }
      )
    end
  end
end