module Types
  class AuthTokenType < Types::BaseObject
    graphql_name 'AuthTokenType'
    description 'Auth token Provider'

    field :csrf,
          String,
          null: false,
          description: 'CSRF protection token'

    field :access,
          String,
          null: false,
          description: 'Access JWT Token'

    field :refresh,
          String,
          null: false,
          description: 'JWT token for refreshing access token'
  end
end
