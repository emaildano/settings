Path = require 'path'
{CompositeDisposable, Emitter} = require 'atom'
LinterViews = require './linter-views'
<<<<<<< HEAD
MessageRegistry = require './message-registry'
EditorRegistry = require './editor-registry'
EditorLinter = require './editor-linter'
LinterRegistry = require './linter-registry'
IndieRegistry = require './indie-registry'
Helpers = require './helpers'
Commands = require './commands'
=======
EditorLinter = require './editor-linter'
Helpers = require './helpers'
Commands = require './commands'
{deprecate} = require 'grim'
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566

class Linter
  # State is an object by default; never null or undefined
  constructor: (@state)  ->
    @state.scope ?= 'File'

    # Public Stuff
    @lintOnFly = true # A default art value, to be immediately replaced by the observe config below

    # Private Stuff
    @emitter = new Emitter
<<<<<<< HEAD
    @linters = new LinterRegistry
    @indieLinters = new IndieRegistry()
    @editors = new EditorRegistry
    @messages = new MessageRegistry()
    @views = new LinterViews(state.scope, @editors)
    @commands = new Commands(this)

    @subscriptions = new CompositeDisposable(@views, @editors, @linters, @messages, @commands, @indieLinters)

    @indieLinters.observe (indieLinter) =>
      indieLinter.onDidDestroy =>
        @messages.deleteMessages(indieLinter)
    @indieLinters.onDidUpdateMessages ({linter, messages}) =>
      @messages.set({linter, messages})
    @linters.onDidUpdateMessages ({linter, messages, editor}) =>
      @messages.set({linter, messages, editorLinter: @editors.ofTextEditor(editor)})
    @messages.onDidUpdateMessages (messages) =>
      @views.render(messages)
    @views.onDidUpdateScope (scope) =>
      @state.scope = scope
=======
    @linters = new (require('./linter-registry'))()
    @editors = new (require('./editor-registry'))()
    @messages = new (require('./message-registry'))()
    @views = new LinterViews(this)
    @commands = new Commands(this)

    @subscriptions = new CompositeDisposable(@views, @editors, @linters, @messages, @commands)

    @subscriptions.add @linters.onDidUpdateMessages (info) =>
      @messages.set(info)
    @subscriptions.add @messages.onDidUpdateMessages (messages) =>
      @views.render(messages)
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566

    @subscriptions.add atom.config.observe 'linter.lintOnFly', (value) =>
      @lintOnFly = value
    @subscriptions.add atom.project.onDidChangePaths =>
      @commands.lint()

    @subscriptions.add atom.workspace.observeTextEditors (editor) => @createEditorLinter(editor)

  addLinter: (linter) ->
    @linters.addLinter(linter)

  deleteLinter: (linter) ->
    return unless @hasLinter(linter)
    @linters.deleteLinter(linter)
    @deleteMessages(linter)

  hasLinter: (linter) ->
    @linters.hasLinter(linter)

  getLinters: ->
    @linters.getLinters()

  setMessages: (linter, messages) ->
    @messages.set({linter, messages})

  deleteMessages: (linter) ->
    @messages.deleteMessages(linter)

  getMessages: ->
    @messages.publicMessages

  onDidUpdateMessages: (callback) ->
    @messages.onDidUpdateMessages(callback)

<<<<<<< HEAD
=======
  onDidChangeMessages: (callback) ->
    deprecate("Linter::onDidChangeMessages is deprecated, use Linter::onDidUpdateMessages instead")
    @onDidUpdateMessages(callback)

  onDidChangeProjectMessages: (callback) ->
    deprecate("Linter::onDidChangeProjectMessages is deprecated, use Linter::onDidChangeMessages instead")
    @onDidChangeMessages(callback)

  getProjectMessages: ->
    deprecate("Linter::getProjectMessages is deprecated, use Linter::getMessages instead")
    @getMessages()

  setProjectMessages: (linter, messages) ->
    deprecate("Linter::setProjectMessages is deprecated, use Linter::setMessages instead")
    @setMessages(linter, messages)

  deleteProjectMessages: (linter) ->
    deprecate("Linter::deleteProjectMessages is deprecated, use Linter::deleteMessages instead")
    @deleteMessages(linter)

>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
  getActiveEditorLinter: ->
    @editors.ofActiveTextEditor()

  getEditorLinter: (editor) ->
    @editors.ofTextEditor(editor)

<<<<<<< HEAD
  getEditorLinterByPath: (path) ->
    @editors.ofPath(path)

=======
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
  eachEditorLinter: (callback) ->
    @editors.forEach(callback)

  observeEditorLinters: (callback) ->
    @editors.observe(callback)

  createEditorLinter: (editor) ->
<<<<<<< HEAD
    return if @editors.has(editor)

    editorLinter = @editors.create(editor)
    editorLinter.onShouldUpdateBubble =>
      @views.renderBubble(editorLinter)
    editorLinter.onShouldLint (onChange) =>
      @linters.lint({onChange, editorLinter})
    editorLinter.onDidDestroy =>
      @messages.deleteEditorMessages(editorLinter)
    editorLinter.onDidCalculateLineMessages =>
      @views.updateCounts()
      @views.bottomPanel.refresh() if @state.scope is 'Line'
    @views.notifyEditorLinter(editorLinter)
=======
    editorLinter = @editors.create(editor)
    editorLinter.onShouldUpdateBubble =>
      @views.renderBubble()
    editorLinter.onShouldUpdateLineMessages =>
      @views.renderLineMessages(true)
    editorLinter.onShouldLint (onChange) =>
      @linters.lint({onChange, editorLinter})
    editorLinter.onDidDestroy =>
      @messages.deleteEditorMessages(editor)
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566

  deactivate: ->
    @subscriptions.dispose()

module.exports = Linter
