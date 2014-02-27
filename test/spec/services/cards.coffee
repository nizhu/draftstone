'use strict'

describe 'Service: Cards', () ->

  # load the service's module
  beforeEach module 'draftstoneApp'

  # instantiate service
  Cards = {}
  beforeEach inject (_Cards_) ->
    Cards = _Cards_

  it 'should do something', () ->
    expect(!!Cards).toBe true
