# Configuration

https://bundler.io/v1.16/bundle_config.html

BUNDLE_IGNORE_CONFIG
BUNDLE_ALLOW_BUNDLER_DEPENDENCY_CONFLICTS
BUNDLE_BIN
BUNDLE_DISABLE_SHARED_GEMS
BUNDLE_GEMFILE
BUNDLE_PATH
BUNDLE_SILENCE_ROOT_WARNING

# Cookbook

## Make a standalone script

```ruby
#!/usr/bin/env ruby

require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "GEM"
end
```
