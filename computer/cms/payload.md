# Generate a project

```bash
npx create-payload-app -n NAME -t blank
cd NAME
rm -rf .git
git init
rm -rf ./src/app/my-route
npm run generate:types
npm run payload migrate:create
```

Edit `src/migrations/DATE_TIME.ts`, removing unused variables.

Set up a `PAYLOAD_SECRET` environment variable, .e.g. in `.envrc`.

Check the build:

```bash
npm run build
```

Add the generated project to git.

# Project Structure

```
src/
├── app/             # Next.js views
    ├── (payload)/   # Payload CMS
    ├── api/         # API routes
    ├── admin/       # Admin panel
    ├── importMap.js # Import map for custom components (https://payloadcms.com/docs/custom-components/overview#import-map)
├── collections/     # Data models
├── migrations/      # Database migrations
├── payload.config.ts # Payload CMS configuration
```

# Configuration

https://payloadcms.com/docs/admin/overview

# Development

## Add a Model

* Create `src/collections/MODEL.ts`,
* Add to `src/payload.config.ts`,
* Run `npm run generate:types`,
* Run `npm run payload migrate:create`,
* Check `npm run build`.

## Add a Block

* Create `src/blocks/BLOCK.ts`.

## Add a Custom Component

After adding any custom component

* Run `npm run payload generate:importmap`
* Check `npm run build`.

# GraphQL

## API Keys

To get an API key, enable the API key auth strategy in your Users collection:

```ts
export const Users: CollectionConfig = {
  ...
  auth: {
    useAPIKey: true,
  }
}
```

## Endpoint

`/api/graphql`

## GraphQL Playground

`/api/graphql-playground`

# Generate Migrations after Model Changes

```bash
npm run payload migrate:create
```
