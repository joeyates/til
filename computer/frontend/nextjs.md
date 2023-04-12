# Create a project

yarn create next-app

# Start Dev

yarn dev

# Production build

yarn build

# Use Production Build

yarn start

# API

## next/document

### NextScript

Inserts `<script...` elements


# Add a Page

```sh
{
  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    }
  }
}
```

src/pages/index.js:

```
const HomePage = () => {
  return <div>Home page</div>
}

export default HomePage
```

# Use GraphQL

pages/index.js:

```
const HomePage = ({home}) => {
  return <div>Home page</div>
}

const getStaticProps async= () {
  const res = await fetch('https://.../posts')
  const home = await res.json()

  return {
    props: {
      home
    }
  }
}

export {getStaticProps}
export default HomePage
```

# Cookbook

## With Sass

yarn add sass

next.config.js:

```diff
+const path = require('path')
+
 const nextConfig = {
+  sassOptions: {
+    includePaths: [path.join(__dirname, 'styles')],
+  }
 }
```

## Sass Variables

https://beta.nextjs.org/docs/styling/sass
