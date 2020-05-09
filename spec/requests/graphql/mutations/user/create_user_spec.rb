require 'rails_helper'

describe 'mutation createUser', type: :request do
  let(:default_variables) do
    {
        email: Faker::Internet.email,
        name: Faker::Name.name
    }
  end
  let(:token) do
    create(:user_default, email: Faker::Internet.email).jwt!
  end

  context 'when params are valid' do
    it 'returns auth tokens' do
      graphql_post(
          query: crate_user_mutation,
          variables: variables,
          headers: { 'Authorization': token }
      )

      expect(response.status).to be(200)
      expect(JSON.parse(response.body)["errors"]).to be_nil
    end
  end

  context 'when email is not unique' do
    let!(:user) { create(:user_default) }
    it 'returns error data' do
      graphql_post(
          query: crate_user_mutation,
          variables: variables(email: user.email),
          headers: { 'Authorization': token }
      )
      expect(response.status).to be(200)
      expect(JSON.parse(response.body)["errors"]&.length).not_to be(0)
    end
  end

  def variables(attributes = {})
    { user: default_variables.merge(attributes) }
  end
end
