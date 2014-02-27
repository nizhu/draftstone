'use strict'

describe 'Service: Classes', () ->

  # load the service's module
  beforeEach module 'draftstoneApp'

  # instantiate service
  Classes = {}
  beforeEach inject (_Classes_) ->
    Classes = _Classes_

  it 'should do something', () ->
    expect(!!Classes).toBe true
