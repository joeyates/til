# Basics

https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Basic_Concepts_of_Flexbox

Flex boxes are container.
They organize their contained items.
They deal with layout in one dimension, set by `flex-direction`.
They have two axes:
* the main axis - defined by `flex-direction`
* the cross axis - at 90 degrees

# Flex Container

Has 'display: flex'

The main and cross axes have a "start edge" and an "end edge"

## `flex-direction`

* row - follows the flow of text, the "inline direction"
* row-reverse
* column - follow the direction that rows are stacked, the "block direction"
* column-reverse

## `flex-wrap`

## `flex-flow`

Is a shorthand for `flex-direction` e `flex-wrap`

# Flex Items

Items by default:

* display linearly, following the flex-direction
* start at the main axis's start edge
* along the main axis:
  * do not stretch
  * *can* shrink
* stretch to fill the size of the cross axis.

Size concepts:

* "main size" - size of an item along the main axis,
* "remaining space" - size of flex container minus
  the sum of all the items' *main sizes*.

## `flex-grow`

Defines a factor of growth beyond the item's *main size*.
The container's *remaining space* is distributed between
items with non-zero growth values.

Default: 0

## `flex-shrink`

If the *remaining space* is negative, indicates how to shrink the items to fit.

Default: 1

## `flex-basis`

Controls the initial *main size* of the item.

Values:

* `auto` - base *main size* on configured size, or, if not set,
  on the size of the content.
* a width
* max-content
* min-content

Default: auto

## `flex`

Is a shorthand for `flex-grow` `flex-shrink` and `flex-basis`

* `flex: initial` resets values to the defaults `flex: 0 1 auto` - "shrink but don't grow"
* `flex: auto` means `flex: 1 1 auto` - "grow and shrink"
* `flex: none` means `flex: 0 0 auto` - "don't change size"
