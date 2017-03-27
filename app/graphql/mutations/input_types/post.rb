Mutations::InputTypes::Post = GraphQL::InputObjectType.define do
  name "PostInputType"
  description "Properties for creating a Post"

  argument :user_id, !types.Int do
    description "Id of the writer"
  end

  argument :body, !types.String do
    description "Description of the post."
  end
end