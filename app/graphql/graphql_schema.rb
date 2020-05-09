class GraphqlSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  # Opt in to the new runtime (default in future graphql-ruby versions)
  use GraphQL::Execution::Interpreter
  use GraphQL::Analysis::AST

  # Add built-in connections for pagination
  use GraphQL::Pagination::Connections
  # use BatchLoader::GraphQL


  def self.unauthorized_object(error)
    raise GraphQL::ExecutionError, "Permission configuration error"
  end
end
