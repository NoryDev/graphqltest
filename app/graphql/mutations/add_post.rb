Mutations::AddPost = GraphQL::Relay::Mutation.define do

  name "AddPost"
  description "Create a new post"

  input_field :user_id, !types.ID
  input_field :body,    !types.String

  return_field :post, ::Types::PostType
  return_field :errors, types[types.String]
  return_field :success, types.Boolean

  resolve ->(_, input, _) do
    # I dont use input[:user_id] on purpose
    post = ::Post.new(body: input[:body])
    {
      post:   post.valid? ? post : nil,
      errors: post.errors.full_messages,
      success: post.persisted?
    }
  end
end