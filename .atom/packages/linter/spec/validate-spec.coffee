describe 'validate', ->
  validate = require('../lib/validate')
<<<<<<< HEAD
  {getLinter} = require('./common')
  describe '::linter', ->
    it 'throws error if grammarScopes is not an array', ->
      expect ->
        linter = getLinter()
        linter.grammarScopes = false
        validate.linter(linter)
      .toThrow('grammarScopes is not an Array. Got: false')
    it 'throws if lint is missing', ->
      expect ->
        linter = getLinter()
        delete linter.lint
        validate.linter(linter)
      .toThrow()
    it 'throws if lint is not a function', ->
      expect ->
        linter = getLinter()
        linter.lint = 'woah'
        validate.linter(linter)
      .toThrow()
    it 'works well with name attribute', ->
      expect ->
        linter = getLinter()
        linter.name = 1
        validate.linter(linter)
      .toThrow('Linter.name must be a string')
      linter = getLinter()
      linter.name = null
      validate.linter(linter)
    it 'works well with scope attribute', ->
      expect ->
        linter = getLinter()
        linter.scope = null
        validate.linter(linter)
      .toThrow('Linter.scope must be either `file` or `project`')
      expect ->
        linter = getLinter()
        linter.scope = 'a'
        validate.linter(linter)
      .toThrow('Linter.scope must be either `file` or `project`')
      linter = getLinter()
      linter.scope = 'Project'
      validate.linter(linter)
    it 'works overall', ->
      validate.linter(getLinter())
      expect(true).toBe(true)
=======
  describe '::linter', ->
    it 'throws error if grammarScopes is not an array', ->
      expect ->
        validate.linter({lint: -> })
      .toThrow("grammarScopes is not an Array. Got: undefined")
    it 'throws if lint is missing', ->
      expect ->
        validate.linter({grammarScopes: []})
      .toThrow()
    it 'throws if lint is not a function', ->
      expect ->
        validate.linter({grammarScopes: [], lint: true})
      .toThrow()
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566

  describe '::messages', ->
    it 'throws if messages is not an array', ->
      expect ->
        validate.messages()
<<<<<<< HEAD
      .toThrow('Expected messages to be array, provided: undefined')
      expect ->
        validate.messages(true)
      .toThrow('Expected messages to be array, provided: boolean')
    it 'throws if type field is not present', ->
      expect ->
        validate.messages([{}], {name: ''})
      .toThrow()
    it 'throws if type field is invalid', ->
      expect ->
        validate.messages([{type: 1}], {name: ''})
      .toThrow()
    it "throws if there's no html/text field on message", ->
      expect ->
        validate.messages([{type: 'Error'}], {name: ''})
      .toThrow()
    it 'throws if html/text is invalid', ->
      expect ->
        validate.messages([{type: 'Error', html: 1}], {name: ''})
      .toThrow()
      expect ->
        validate.messages([{type: 'Error', text: 1}], {name: ''})
      .toThrow()
      expect ->
        validate.messages([{type: 'Error', html: false}], {name: ''})
      .toThrow()
      expect ->
        validate.messages([{type: 'Error', text: false}], {name: ''})
      .toThrow()
      expect ->
        validate.messages([{type: 'Error', html: []}], {name: ''})
      .toThrow()
      expect ->
        validate.messages([{type: 'Error', text: []}], {name: ''})
      .toThrow()
    it 'throws if trace is invalid', ->
      expect ->
        validate.messages([{type: 'Error', html: 'a', trace: 1}], {name: ''})
      .toThrow()
      validate.messages([{type: 'Error', html: 'a', trace: false}], {name: ''})
    it 'throws if class is invalid', ->
      expect ->
        validate.messages([{type: 'Error', text: 'Well', class: 1}], {name: ''})
      .toThrow()
      expect ->
        validate.messages([{type: 'Error', text: 'Well', class: []}], {name: ''})
      .toThrow()
      validate.messages([{type: 'Error', text: 'Well', class: 'error'}], {name: ''})
    it 'throws if filePath is invalid', ->
      expect ->
        validate.messages([{type: 'Error', text: 'Well', class: 'error', filePath: 1}], {name: ''})
      .toThrow()
      validate.messages([{type: 'Error', text: 'Well', class: 'error', filePath: '/'}], {name: ''})
    it 'throws if both text and html are provided', ->
      expect ->
        validate.messages([{type: 'Error', text: 'Well', html: 'a', class: 'error', filePath: '/'}], {name: ''})
      .toThrow()
      validate.messages([{type: 'Error', text: 'Well', class: 'error', filePath: '/'}], {name: ''})
      validate.messages([{type: 'Error', html: 'Well', class: 'error', filePath: '/'}], {name: ''})
      validate.messages([{type: 'Error', html: document.createElement('div'), class: 'error', filePath: '/'}], {name: ''})
=======
      .toThrow("Expected messages to be array, provided: undefined")
      expect ->
        validate.messages(true)
      .toThrow("Expected messages to be array, provided: boolean")
    it 'throws if type field is not present', ->
      expect ->
        validate.messages([{}])
      .toThrow()
    it "throws if type field is invalid", ->
      expect ->
        validate.messages([{type: 1}])
      .toThrow()
    it "throws if there's no html/text field on message", ->
      expect ->
        validate.messages([{type: 'Error'}])
      .toThrow()
    it "throws if html/text is invalid", ->
      expect ->
        validate.messages([{type: 'Error', html: 1}])
      .toThrow()
      expect ->
        validate.messages([{type: 'Error', text: 1}])
      .toThrow()
      expect ->
        validate.messages([{type: 'Error', html: false}])
      .toThrow()
      expect ->
        validate.messages([{type: 'Error', text: false}])
      .toThrow()
      expect ->
        validate.messages([{type: 'Error', html: []}])
      .toThrow()
      expect ->
        validate.messages([{type: 'Error', text: []}])
      .toThrow()
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
