# Spies

* [jasmine.createSpy][create-spy](name)

  Creates a single spy.

* [jasmine.createSpyObj][create-spy-obj](name, properties)

  Creates an object with a series of spy properties.

* jasmine.spyOn(object, 'method')

  Intercepts calls to an existing method. Should be followed by an action (see below).

[create-spy]: http://jasmine.github.io/2.0/introduction.html#section-Spies:_%3Ccode%3EcreateSpy%3C/code%3E
[create-spy-obj]: http://jasmine.github.io/2.0/introduction.html#section-Spies:_%3Ccode%3EcreateSpyObj%3C/code%3E

## Properties

* object.method.calls => CallTracker

## Actions

* .and.callThrough()
* .and.returnValue(value)

Successive calls to `returnValue` replace the value that the call will return.

* .and.throw(exception)
* .and.callFake(function)

# Matchers

* toBe
* toBeCloseTo
* toBeDefined
* toBeFalsy
* toBeGreaterThan
* toBeLessThan
* toBeNaN
* toBeNull
* toBeTruthy
* toBeUndefined
* toContain
* toEqual
* toMatch
* toThrow
* toThrowError

Call a matcher:

`expect(x).toHaveBeenCalled()`

## Spy Matchers

* toHaveBeenCalled
* toHaveBeenCalledWith

# CallTracker

## Methods

* all()
* allArgs()
* any()
* argsFor(index)
* count()
* first()
* mostRecent()
* reset()
* track(context)

# Debugging

* console.log

# Cookbook

## Test for a sub-class

`expect(x).toEqual(jasmine.any(klass))`

# Docs

* http://jasmine.github.io/2.0/introduction.html
