Types::CommentType = GraphQL::ObjectType.define do
  name "Comment"
  field :id,         !types.ID
  field :body,       !types.String
  field :created_at, !types.String
  field :user,       !Types::UserType do
    resolve ->(obj, args, ctx) {
      Loaders::Record.for(User).load(obj.user_id)
    }
  end
end
