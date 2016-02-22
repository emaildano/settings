{Range} = require('atom')
path = require 'path'
child_process = require('child_process')
<<<<<<< HEAD
minimatch = require('minimatch')
=======
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566

Helpers = module.exports =
  error: (e) ->
    atom.notifications.addError(e.toString(), {detail: e.stack or '', dismissable: true})
<<<<<<< HEAD
  shouldTriggerLinter: (linter, onChange, scopes) ->
=======
  shouldTriggerLinter: (linter, bufferModifying, onChange, scopes) ->
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
    # Trigger lint-on-Fly linters on both events but on-save linters only on save
    # Because we want to trigger onFly linters on save when the
    # user has disabled lintOnFly from config
    return false if onChange and not linter.lintOnFly
    return false unless scopes.some (entry) -> entry in linter.grammarScopes
    return false if linter.modifiesBuffer isnt bufferModifying
    return true
  requestUpdateFrame: (callback) ->
    setTimeout(callback, 100)
<<<<<<< HEAD
  debounce: (callback, delay) ->
    timeout = null
    return (arg) ->
      clearTimeout(timeout)
      timeout = setTimeout(() =>
        callback.call(this, arg)
      , delay)
  isPathIgnored: (filePath) ->
    repo = null
    for projectPath, i in atom.project.getPaths()
      if filePath.indexOf(projectPath + path.sep) is 0
        repo = atom.project.getRepositories()[i]
        break
    return true if repo and repo.isProjectAtRoot() and repo.isPathIgnored(filePath)
    return minimatch(filePath, atom.config.get('linter.ignoreMatchedFiles'))
=======
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
