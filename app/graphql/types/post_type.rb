Types::PostType = GraphQL::ObjectType.define do
  name "Post"
  description "A blog post"
  field :id,         !types.ID
  field :body,       !types.String
  field :user,       !Types::UserType do
    resolve ->(obj, args, ctx) {
      Loaders::Record.for(User).load(obj.user_id)
    }
  end
  field :comments,   types[!Types::CommentType] do
    resolve ->(obj, args, ctx) {
      Loaders::ForeignKey.for(Comment, :post_id).load([obj.id])
    }
  end
  field :created_at, !types.String
end