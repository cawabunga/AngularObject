'use strict'

class @AngularObject

  @type: (type) ->
    @componentType = type

  @register: (app) ->
    name = @name || @toString().match(/function\s*(.*?)\(/)?[1]
    angular.module(app)[@_getType(name)] name, @

  @inject: (args...) ->
    @$inject = _.union(@$inject || [], args)

  constructor: (args...) ->
    for key, index in @constructor.$inject
      @[key] = args[index]

    if @$scope?
      for key, fn of @constructor.prototype
        continue unless typeof fn is 'function'
        continue if key in ['constructor', 'initialize'] or key[0] is '_'
        @$scope[key] = fn.bind?(@) || _.bind(fn, @)

    @initialize?()

#  private
  @_getType: (name) ->
    unless type = @componentType
      type = name.match(/([A-Z][a-z]+)$/)[1].toLowerCase()
    type
