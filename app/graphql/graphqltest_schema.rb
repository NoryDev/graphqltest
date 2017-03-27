GraphqltestSchema = GraphQL::Schema.define do
  query(Types::QueryType)
  mutation(Mutations::Root)
  lazy_resolve(Promise, :sync)
  instrument(:query, GraphQL::Batch::Setup)
end
