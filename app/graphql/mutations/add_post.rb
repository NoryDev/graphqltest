Mutations::AddPost = GraphQL::Relay::Mutation.define do

  # name "AddPost"

  input_field :user_id, !types.Int
  input_field :body,    !types.String

  return_field :post, Types::PostType
  # return_interfaces [Mutations::Result]

  resolve ->(t, input, c) {
    post = ::Post.new
    # title = args['post']['title']
    # description = args['post']['description']
    # Post.create(title: title, description: description)
    {
      post: post
    }
  }
end