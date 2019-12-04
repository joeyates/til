# Cookbook

## Ecmascript Access to CSS Variables

window.onload = () => {
  const style = getComputedStyle(document.documentElement)
  const width = style.getPropertyValue('--width')
  console.log("width: ", width)
}
