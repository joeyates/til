# React.js

# React

Methods:
* createClass()

# React.Component

## Methods [docs][comp-docs]

* forceUpdate
* getDOMNode
* getInitialState
* isMounted
* replaceState
* setProps
* setState

## Lifecycle methods [docs][comp-specs]

* componentDidMount - called by react when a component is rendered
* render() - render a Class on a DOM node
* `componentDidMount()`
* `componentWillReceiveProps(nextProps)`
* `boolean shouldComponentUpdate(object nextProps, object nextState)` [docs][comp-scu-docs]
* `componentWillUpdate(nextProps, nextState)`
* `componentDidUpdate(prevProps, prevState)`
* `componentWillUnmount()`
* `componentDidCatch(error, info)`

* https://reactjs.org/docs/react-component.html

[comp-docs]: https://facebook.github.io/react/docs/component-api.html
[comp-specs]: https://facebook.github.io/react/docs/component-specs.html
[comp-scu-docs]: https://facebook.github.io/react/docs/component-specs.html#updating-shouldcomponentupdate

Attributes:
* props
* stats

## Children

https://mxstbr.blog/2017/02/react-children-deepdive/
