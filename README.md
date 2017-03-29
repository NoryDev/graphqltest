### Mutation

mutation {
  addPost(input: {
    user_id: 1,
    body:    "hello dolly"
  }){
    post {
      id
      body
    }
    errors
    success
  }
}
### Query
{
  posts{
    id
    body
    user{
      name
    }
    comments{
      user{
        name
      }
    }
  }
}