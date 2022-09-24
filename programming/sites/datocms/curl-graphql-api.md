# Environment

```
export DATOCMS_API_TOKEN=
export DATOCMS_GRAPHQL_API_URL=https://graphql.datocms.com
```

# Or staging
# export DATOCMS_GRAPHQL_API_URL=https://graphql-staging.datocms.com

```
curl \
  -H "Authorization: Bearer $DATOCMS_API_TOKEN" \
  -H "Accept: application/json" \
  --request POST \
  --data '{"query": "GRAPHQL QUERY"}' \
  $DATOCMS_GRAPHQL_API_URL/
```

```
curl \
  -H "Authorization: Bearer $DATOCMS_API_TOKEN" \
  -H "Accept: application/json" \
  -XPOST \
  --data '{"query": "query { allPosts {id}}"}' \
  $DATOCMS_GRAPHQL_API_URL
```
