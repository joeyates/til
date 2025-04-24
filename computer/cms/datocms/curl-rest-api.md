# Environment

DATOCMS_API_TOKEN
DATOCMS_REST_API_URL=https://site-api.datocms.com

Get site data:

curl \
  -H "Authorization: Bearer $DATOCMS_API_TOKEN" \
  -H "Accept: application/json" \
  $DATOCMS_REST_API_URL/site

# Records

Fetch a record:

curl \
  -H "Authorization: Bearer $DATOCMS_API_TOKEN" \
  -H "Accept: application/json" \
  $DATOCMS_REST_API_URL/items/$ITEM_ID

Update a record:

curl \
  -H "Authorization: Bearer $DATOCMS_API_TOKEN" \
  -H "Accept: application/json" \
  --header "Content-Type: application/json" \
  -X PUT \
  --data '{...}' \
  $DATOCMS_REST_API_URL/items/$ITEM_ID
