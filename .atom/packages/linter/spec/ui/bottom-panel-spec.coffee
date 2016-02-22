describe 'BottomPanel', ->
<<<<<<< HEAD
  BottomPanel = require('../../lib/ui/bottom-panel')
  linter = null
  bottomPanel = null
  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage('linter').then ->
        linter = atom.packages.getActivePackage('linter').mainModule.instance
        bottomPanel?.dispose()
        bottomPanel = new BottomPanel('File')
        atom.workspace.open(__dirname + '/fixtures/file.txt')

  {getMessage} = require('../common')

  it 'is not visible when there are no errors', ->
    expect(linter.views.bottomPanel.getVisibility()).toBe(false)

  it 'hides on config change', ->
    # Set up visibility.
    linter.views.bottomPanel.scope = 'Project'
    linter.views.bottomPanel.setMessages({added: [getMessage('Error')], removed: []})

    expect(linter.views.bottomPanel.getVisibility()).toBe(true)
    atom.config.set('linter.showErrorPanel', false)
    expect(linter.views.bottomPanel.getVisibility()).toBe(false)
    atom.config.set('linter.showErrorPanel', true)
    expect(linter.views.bottomPanel.getVisibility()).toBe(true)
  describe '{set, remove}Messages', ->
    it 'works as expected', ->
      bottomPanel.scope = 'Project'
      messages = [getMessage('Error'), getMessage('Warning')]
      bottomPanel.setMessages({added: messages, removed: []})
      expect(bottomPanel.messagesElement.childNodes.length).toBe(1)
      expect(bottomPanel.messagesElement.childNodes[0].childNodes.length).toBe(2)
      bottomPanel.setMessages({added: [], removed: messages})
      expect(bottomPanel.messagesElement.childNodes.length).toBe(1)
      expect(bottomPanel.messagesElement.childNodes[0].childNodes.length).toBe(0)
      bottomPanel.setMessages({added: messages, removed: []})
      expect(bottomPanel.messagesElement.childNodes[0].childNodes.length).toBe(2)
      bottomPanel.removeMessages(messages)
      expect(bottomPanel.messagesElement.childNodes.length).toBe(1)
      expect(bottomPanel.messagesElement.childNodes[0].childNodes.length).toBe(0)
=======
  {BottomPanel} = require('../../lib/ui/bottom-panel')
  linter = null
  bottomPanel = null
  beforeEach ->
    bottomPanel?.dispose()
    bottomPanel = new BottomPanel('File')
    waitsForPromise ->
      atom.packages.activatePackage('linter').then ->
        linter = atom.packages.getActivePackage('linter').mainModule.instance

  getMessage = (type, filePath) ->
    return {type, text: "Some Message", filePath}

  it 'remains visible when theres no active pane', ->
    expect(linter.views.panel.getVisibility()).toBe(true)

  it 'hides on config change', ->
    expect(linter.views.panel.getVisibility()).toBe(true)
    atom.config.set('linter.showErrorPanel', false)
    expect(linter.views.panel.getVisibility()).toBe(false)
    atom.config.set('linter.showErrorPanel', true)
    expect(linter.views.panel.getVisibility()).toBe(true)

  describe '{set, remove}Messages', ->
    it 'works as expected', ->
      messages = [getMessage('Error'), getMessage('Warning')]
      bottomPanel.setMessages({added: messages, removed: []})
      expect(bottomPanel.element.childNodes.length).toBe(2)
      bottomPanel.setMessages({added: [], removed: messages})
      expect(bottomPanel.element.childNodes.length).toBe(0)
      bottomPanel.setMessages({added: messages, removed: []})
      expect(bottomPanel.element.childNodes.length).toBe(2)
      bottomPanel.removeMessages(messages)
      expect(bottomPanel.element.childNodes.length).toBe(0)
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
