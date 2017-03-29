### Mutation

mutation {
  addPost(input: {
    user_id: 1,
    body:    "hello dolly"
  }){
    post {
      body
    }
    errors
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