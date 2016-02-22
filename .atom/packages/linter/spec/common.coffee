LinterRegistry = require('../lib/linter-registry')
EditorLinter = require('../lib/editor-linter')
<<<<<<< HEAD
Validators = require('../lib/validate')

module.exports =
  wait: (timeout) ->
    return new Promise (resolve) ->
      setTimeout(resolve, timeout)
  getLinter: ->
    return {grammarScopes: ['*'], lintOnFly: false, scope: 'project', lint: -> }
  getMessage: (type, filePath, range) ->
    message = {type, text: 'Some Message', filePath, range}
    Validators.messages([message], {name: 'Some Linter'})
    return message
=======

module.exports =
  getLinter: ->
    return {grammarScopes: ['*'], lintOnFly: false, modifiesBuffer: false, scope: 'project', lint: -> }
  getMessage: (type, filePath) ->
    return {type, text: "Some Message", filePath}
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
  getLinterRegistry: ->
    linterRegistry = new LinterRegistry
    editorLinter = new EditorLinter(atom.workspace.getActiveTextEditor())
    linter = {
      grammarScopes: ['*']
      lintOnFly: false
<<<<<<< HEAD
      scope: 'project'
      lint: -> return [{type: 'Error', text: 'Something'}]
    }
    linterRegistry.addLinter(linter)
    return {linterRegistry, editorLinter, linter}
  trigger: (el, name) ->
    event = document.createEvent('HTMLEvents')
    event.initEvent(name, true, false)
    el.dispatchEvent(event)
=======
      modifiesBuffer: false
      scope: 'project'
      lint: -> return [{type: "Error", text: "Something"}]
    }
    linterRegistry.addLinter(linter)
    return {linterRegistry, editorLinter, linter}
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
