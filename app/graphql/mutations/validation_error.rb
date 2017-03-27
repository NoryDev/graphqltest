Mutations::ValidationError = GraphQL::InterfaceType.define do
  name "ValidationError"
  field :message, types.String
end
