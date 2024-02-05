# Add a LiveView

```sh
mix phx.gen.live {{CONTEXT}} {{SCHEMA}} {{SCHEMA PLURAL}} [ATTRIBUTES]
```

# Add a LiveView to an Application without a Database

```sh
mix phx.gen.live --no-schema {{CONTEXT}} {{RESOURCE singular}} {{ENDPOINT}}
```

Generates:

* The context
* Live index and show (including heex)
  * `lib/{{app}}_web/live/{{resource}}_live/`
* Suggests adding routes in lib/{{application}}_web/router.ex
  * live `/{{endpoint}}`

# View Lifecycle

1. mount(params, session, socket)
* `params` - any query params. This is *public* data, set by the user,
* `session` - private state data set by the application,
* `socket` - the state of the socket.
Called twice, first for static generation (and for crawlers),
and again when the websocket connects.
`connected?(socket)` indicates which case we are in.
Should set up any assigns necessary for rendering the view.

2. handle_params(params, url, socket)
  * params - any query params as a Map, String -> String
  * url - the full URL
Called whenever params change, including on mount.

3. apply_action(socket, action, params)

4. render - or call to co-located template

# Server-side hooks

* on_mount
* attach_hook(socket, name, stage, fun)
  * stage: `:handle_params|:handle_event|:handle_info|:after_render`

# 
