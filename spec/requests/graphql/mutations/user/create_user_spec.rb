require 'rails_helper'


describe 'mutation createUser', type: :request do
  let(:default_variables) do
    {
        email: FFaker::Internet.email,
        name: FFaker::Name.name
    }
  end

  context 'when params are valid' do
    it 'returns auth tokens' do
      graphql_post(
          query: crate_user_mutation,
          variables: variables
      )

      expect(response.status).to be(200)
    end
  end

  # context 'when email is not unique' do
  #   let!(:user_account) { create(:user_account) }
  #
  #   it 'returns error data' do
  #     graphql_post(
  #         query: user_signup_mutation,
  #         variables: variables(email: "  #{user_account.email}")
  #     )
  #
  #     expect(response.status).to be(200)
  #   end
  # end

  def variables(attributes = {})
    { input: default_variables.merge(attributes) }
  end

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
