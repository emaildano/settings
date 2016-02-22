{Range} = require('atom')
helpers = require('./helpers')

module.exports = Validate =

<<<<<<< HEAD
  linter: (linter, indie = false) ->
    unless indie
      unless linter.grammarScopes instanceof Array
        throw new Error("grammarScopes is not an Array. Got: #{linter.grammarScopes}")
      if linter.lint
        throw new Error("linter.lint isn't a function on provider") if typeof linter.lint isnt 'function'
      else
        throw new Error('Missing linter.lint on provider')
      if linter.scope and typeof linter.scope is 'string'
        linter.scope = linter.scope.toLowerCase()
      throw new Error('Linter.scope must be either `file` or `project`') if linter.scope isnt 'file' and linter.scope isnt 'project'
    if linter.name
      throw new Error('Linter.name must be a string') if typeof linter.name isnt 'string'
    else
      linter.name = null
    return true

  messages: (messages, linter) ->
    unless messages instanceof Array
      throw new Error("Expected messages to be array, provided: #{typeof messages}")
    throw new Error 'No linter provided' unless linter
=======
  linter: (linter) ->
    # set undefined to false for backward compatibility
    linter.modifiesBuffer = Boolean(linter.modifiesBuffer)
    unless linter.grammarScopes instanceof Array
      throw new Error("grammarScopes is not an Array. Got: #{linter.grammarScopes}")
    if linter.lint
      throw new Error("linter.lint isn't a function on provider") if typeof linter.lint isnt 'function'
    else
      throw new Error('Missing linter.lint on provider')
    return true

  messages: (messages) ->
    unless messages instanceof Array
      throw new Error("Expected messages to be array, provided: #{typeof messages}")
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
    messages.forEach (result) ->
      if result.type
        throw new Error 'Invalid type field on Linter Response' if typeof result.type isnt 'string'
      else
        throw new Error 'Missing type field on Linter Response'
      if result.html
<<<<<<< HEAD
        throw new Error 'Got both html and text fields on Linter Response, expecting only one' if typeof result.text is 'string'
        throw new Error 'Invalid html field on Linter Response' if typeof result.html isnt 'string' and not (result.html instanceof HTMLElement)
        result.text = null
      else if result.text
        throw new Error 'Invalid text field on Linter Response' if typeof result.text isnt 'string'
        result.html = null
      else
        throw new Error 'Missing html/text field on Linter Response'
      if result.trace
        throw new Error 'Invalid trace field on Linter Response' unless result.trace instanceof Array
      else result.trace = null
      if result.class
        throw new Error 'Invalid class field on Linter Response' if typeof result.class isnt 'string'
      else
        result.class = result.type.toLowerCase().replace(' ', '-')
      if result.filePath
        throw new Error('Invalid filePath field on Linter response') if typeof result.filePath isnt 'string'
      else
        result.filePath = null
      result.range = Range.fromObject result.range if result.range?
      result.key = JSON.stringify(result)
      result.linter = linter.name
      Validate.messages(result.trace, linter) if result.trace and result.trace.length
    return
=======
        throw new Error 'Invalid html field on Linter Response' if typeof result.html isnt 'string'
      else if result.text
        throw new Error 'Invalid text field on Linter Response' if typeof result.text isnt 'string'
      else
        throw new Error 'Missing html/text field on Linter Response'
      result.range = Range.fromObject result.range if result.range?
      result.key = JSON.stringify(result)
      result.class = result.type.toLowerCase().replace(' ', '-')
      Validate.messages(result.trace) if result.trace
    return undefined
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
