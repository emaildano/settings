describe 'helpers', ->
  helpers = require('../lib/helpers')
  beforeEach ->
    atom.notifications.clear()

  describe '::error', ->
    it 'adds an error notification', ->
      helpers.error(new Error())
      expect(atom.notifications.getNotifications().length).toBe(1)

  describe '::shouldTriggerLinter', ->
    normalLinter =
      grammarScopes: ['*']
      scope: 'file'
<<<<<<< HEAD
=======
      modifiesBuffer: false
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
      lintOnFly: false
      lint: ->
    lintOnFly =
      grammarScopes: ['*']
      scope: 'file'
<<<<<<< HEAD
=======
      modifiesBuffer: false
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
      lintOnFly: true
      lint: ->
    bufferModifying =
      grammarScopes: ['*']
      scope: 'file'
<<<<<<< HEAD
      lintOnFly: false
      lint: ->
    it 'accepts a wildcard grammarScope', ->
      expect(helpers.shouldTriggerLinter(normalLinter, false, ['*'])).toBe(true)
    it 'runs lintOnFly ones on both save and lintOnFly', ->
      expect(helpers.shouldTriggerLinter(lintOnFly, false, ['*'])).toBe(true)
      expect(helpers.shouldTriggerLinter(lintOnFly, true, ['*'])).toBe(true)
    it "doesn't run save ones on fly", ->
      expect(helpers.shouldTriggerLinter(normalLinter, true, ['*'])).toBe(false)
=======
      modifiesBuffer: true
      lintOnFly: false
      lint: ->
    it 'accepts a wildcard grammarScope', ->
      expect(helpers.shouldTriggerLinter(normalLinter, false, false, ['*'])).toBe(true)
    it 'runs lintOnFly ones on both save and lintOnFly', ->
      expect(helpers.shouldTriggerLinter(lintOnFly, false, false, ['*'])).toBe(true)
      expect(helpers.shouldTriggerLinter(lintOnFly, false, true, ['*'])).toBe(true)
    it "doesn't run save ones on fly", ->
      expect(helpers.shouldTriggerLinter(normalLinter, false, true, ['*'])).toBe(false)
    it 'runs only if bufferModifying flag matches with linter', ->
      expect(helpers.shouldTriggerLinter(normalLinter, false, false, ['*'])).toBe(true)
      expect(helpers.shouldTriggerLinter(normalLinter, true, false, ['*'])).toBe(false)
      expect(helpers.shouldTriggerLinter(bufferModifying, false, false, ['*'])).toBe(false)
      expect(helpers.shouldTriggerLinter(bufferModifying, true, false, ['*'])).toBe(true)
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
