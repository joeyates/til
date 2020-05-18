# Cookbook

## Ecmascript Access to CSS Variables

window.onload = () => {
  const style = getComputedStyle(document.documentElement)
  const width = style.getPropertyValue('--width')
  console.log("width: ", width)
}

# position

# z-index

indicates which elements appear on top
ordering is within a "stacking context"
stacking contexts are formed:

* the root html element
* elements with a `position` value `absolute` or `relative` and z-index set (not `auto`)
* ...

Attempt at a summary:

* create an element that contains the elements you wish to order,
* set its `z-index` to an integer and `position` to `relative` or `absolute`,
* for each element you wish to order,
  set its `z-index` to an integer and `position` to `relative` or `absolute`
