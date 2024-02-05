# Vega Lite

VegaLite renders a JSON structure, called a spec.

The keys are:

* data - an array of data
* mark - the presentation type
* encoding - details of the presentation

https://github.com/mcintyre94/livebook-performance-testing/blob/main/performance-testing.livemd

# Workflow

* Get a JSON representation of the graphic
* Use `VegaLite.from_json("")`

Scales are indicated by the `:axis` attribute of fields

# Data

Inject a "data" element into the VegaLite spec:

```
VegaLite.data_from_values(vl, )
```

# Marks


## Line

```
VegaLite.mark(vl, :line, options)
```

options:

* point: true|false* - show data points
* interpolate: basis|step|...
  * basis: smoothe
  * cardinal: smoothe, passing through points
  * step: horizontal lines from points, vertical to new values
* stroke_width: number - width in picxels of the line
