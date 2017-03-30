Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end

  field :user do
    type Types::UserType
    argument :id, !types.ID
    description "Find a User by ID"
    resolve ->(obj, args, ctx) { Loaders::Record.for(User).load(args["id"].to_i) }
  end

  field :post do
    type Types::PostType
    argument :id, !types.ID
    description "Find a Post by ID"
    resolve ->(obj, args, ctx) { Loaders::Record.for(Post).load(args["id"].to_i) }
  end

  field :posts do
    argument :page, types.Int
    argument :per_page, types.Int
    type types[Types::PostType]
    description "retrieve posts"
    resolve ->(obj, args, ctx) {
      Post.all.page(args[:page]).per(args[:per_page] || 5)
    }
  end
end

