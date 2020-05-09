module Graphql
  module RequestHelpers
    include ActionDispatch::Integration::RequestHelpers

    def graphql_post(query:, variables: {}, headers: nil, **kwargs)
      post('/graphql',
           params: {
               query: query,
               variables: normalize_hash(variables).to_json
           },
           headers: headers,
           **kwargs
      )
    end

    private

    def normalize_hash(hash)
      raise unless hash.is_a?(Hash)

      hash = convert_decimal_values(hash)
      camelize_hash_keys(hash)
    end

    def convert_decimal_values(hash)
      hash.transform_values do |val|
        next convert_decimal_values(val) if val.is_a?(::Hash)

        val.is_a?(::BigDecimal) ? val.to_f : val
      end
    end

    def camelize_hash_keys(hash)
      hash.deep_transform_keys { |key| key.to_s.camelize(:lower) }
    end
  end
end