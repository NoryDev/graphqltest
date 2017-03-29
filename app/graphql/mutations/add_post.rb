Mutations::AddPost = GraphQL::Relay::Mutation.define do

  name "AddPost"
  description "Create a new post"

  input_field :user_id, !types.ID
  input_field :body,    !types.String

  return_field :post, ::Types::PostType
  return_field :errors, types[types.String]
  # return_interfaces [Mutations::Result]

  resolve ->(_, input, _) do
    post = ::Post.new(body: input[:body])
    post.valid?
    {
      post: post,
      errors: post.errors.full_messages
    }
  end
end