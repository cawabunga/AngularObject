
class Session extends AngularService

  @register 'App'
  @inject 'localStorageService'

  set: (key, id) ->
    @localStorageService.add key, id

  get: (key) ->
    @localStorageService.get key

  remove: (key) ->
    @localStorageService.remove key
