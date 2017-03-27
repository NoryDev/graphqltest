Mutations::Result = GraphQL::InterfaceType.define do
  name "MutationResult"
  field :success, !types.Boolean
  field :notice, types.String
  field :errors, types[Mutations::ValidationError]
end
