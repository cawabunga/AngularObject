'use strict'

class @AngularResource extends AngularService

  @inject 'Restangular', '$log'

  @resource: (resourceName) ->
    @resourceName = resourceName

  constructor: (args...) ->
    super(args...)
    @repository = @Restangular.all(@constructor.resourceName)


  all: (params = {}) =>
    @repository.getList(params)

  find: (id, params = {}) =>
    @repository.one(id).get(params)

  objects: (params = {}) =>
    @repository.getList(params).$object

  create: (obj) =>
    @repository.post(obj)