GRAPHQL_BASE_URL=https://graphql.datocms.com
DATOCMS_API_TOKEN=...

curl \
  -H "Authorization: Bearer $DATOCMS_API_TOKEN" \
  -H "Accept: application/json" \
  -XPOST \
  --data '{"query": "query { allPosts {id}}"}' \
  $GRAPHQL_BASE_URL
