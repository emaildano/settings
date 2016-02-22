describe 'editor-registry', ->
  EditorRegistry = require('../lib/editor-registry')
  editorRegistry = null
  beforeEach ->
    waitsForPromise ->
      atom.workspace.destroyActivePaneItem()
<<<<<<< HEAD
      atom.workspace.open(__dirname + '/fixtures/file.txt')
=======
      atom.workspace.open('test.txt')
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
    editorRegistry?.dispose()
    editorRegistry = new EditorRegistry

  describe '::create', ->
    it 'cries when invalid TextEditor was provided', ->
      expect ->
        editorRegistry.create()
<<<<<<< HEAD
      .toThrow()
      expect ->
        editorRegistry.create(5)
      .toThrow()
=======
      .toThrow("Given editor isn't really an editor")
      expect ->
        editorRegistry.create(5)
      .toThrow("Given editor isn't really an editor")
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
    it "adds TextEditor to it's registry", ->
      editorRegistry.create(atom.workspace.getActiveTextEditor())
      expect(editorRegistry.editorLinters.size).toBe(1)
    it 'automatically clears the TextEditor from registry when destroyed', ->
      editorRegistry.create(atom.workspace.getActiveTextEditor())
      atom.workspace.destroyActivePaneItem()
      expect(editorRegistry.editorLinters.size).toBe(0)

<<<<<<< HEAD
  describe '::has', ->
    it 'returns the status of existence', ->
      editor = atom.workspace.getActiveTextEditor()
      expect(editorRegistry.has(1)).toBe(false)
      expect(editorRegistry.has(false)).toBe(false)
      expect(editorRegistry.has([])).toBe(false)
      expect(editorRegistry.has(editor)).toBe(false)
      editorRegistry.create(editor)
      expect(editorRegistry.has(editor)).toBe(true)
      atom.workspace.destroyActivePaneItem()
      expect(editorRegistry.has(editor)).toBe(false)

=======
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
  describe '::forEach', ->
    it 'calls the callback once per editorLinter', ->
      editorRegistry.create(atom.workspace.getActiveTextEditor())
      timesCalled = 0
      editorRegistry.forEach -> ++timesCalled
      editorRegistry.forEach -> ++timesCalled
      expect(timesCalled).toBe(2)

  describe '::ofTextEditor', ->
    it 'returns undefined when invalid key is provided', ->
      expect(editorRegistry.ofTextEditor(null)).toBeUndefined()
      expect(editorRegistry.ofTextEditor(1)).toBeUndefined()
      expect(editorRegistry.ofTextEditor(5)).toBeUndefined()
<<<<<<< HEAD
      expect(editorRegistry.ofTextEditor('asd')).toBeUndefined()
    it 'returns editorLinter when valid key is provided', ->
      activeEditor = atom.workspace.getActiveTextEditor()
      expect(editorRegistry.ofTextEditor(activeEditor)).toBeUndefined()
      editorRegistry.create(activeEditor)
      expect(editorRegistry.ofTextEditor(activeEditor)).toBeDefined()

  describe '::ofPath', ->
    it 'returns undefined when invalid key is provided', ->
      expect(editorRegistry.ofPath(null)).toBeUndefined()
      expect(editorRegistry.ofPath(1)).toBeUndefined()
      expect(editorRegistry.ofPath(5)).toBeUndefined()
      expect(editorRegistry.ofPath('asd')).toBeUndefined()
    it 'returns editorLinter when valid key is provided', ->
      activeEditor = atom.workspace.getActiveTextEditor()
      editorPath = activeEditor.getPath()
      expect(editorRegistry.ofPath(editorPath)).toBeUndefined()
      editorRegistry.create(activeEditor)
      expect(editorRegistry.ofPath(editorPath)).toBeDefined()

=======
      expect(editorRegistry.ofTextEditor("asd")).toBeUndefined()
    it 'returns editorLinter when valid key is provided', ->
      activeEditor = atom.workspace.getActiveTextEditor()
      editorRegistry.create(activeEditor)
      expect(editorRegistry.ofTextEditor(activeEditor)).toBeDefined()

>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
  describe '::observe', ->
    it 'calls with the current editorLinters', ->
      timesCalled = 0
      editorRegistry.create(atom.workspace.getActiveTextEditor())
      editorRegistry.observe -> ++timesCalled
      expect(timesCalled).toBe(1)
    it 'calls in the future with new editorLinters', ->
      timesCalled = 0
      editorRegistry.observe -> ++timesCalled
      editorRegistry.create(atom.workspace.getActiveTextEditor())
      waitsForPromise ->
        atom.workspace.open('someNonExistingFile').then ->
          editorRegistry.create(atom.workspace.getActiveTextEditor())
          expect(timesCalled).toBe(2)

  describe '::ofActiveTextEditor', ->
    it 'returns undefined if active pane is not a text editor', ->
      expect(editorRegistry.ofActiveTextEditor()).toBeUndefined()
    it 'returns editorLinter when active pane is a text editor', ->
      editorRegistry.create(atom.workspace.getActiveTextEditor())
      expect(editorRegistry.ofActiveTextEditor()).toBeDefined()
