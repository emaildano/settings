'use babel'
<<<<<<< HEAD
import {Emitter, CompositeDisposable} from 'atom'
=======
import {Emitter, TextEditor, CompositeDisposable} from 'atom'
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566

const Validate = require('./validate')
const Helpers = require('./helpers')

class MessageRegistry {
  constructor() {
    this.hasChanged = false
    this.shouldRefresh = true
    this.publicMessages = []
    this.subscriptions = new CompositeDisposable()
    this.emitter = new Emitter()
    this.linterResponses = new Map()
<<<<<<< HEAD
    this.messages = new Map()
=======
    this.editorMessages = new Map()
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566

    this.subscriptions.add(this.emitter)
    this.subscriptions.add(atom.config.observe('linter.ignoredMessageTypes', value => this.ignoredMessageTypes = (value || [])))

    const UpdateMessages = () => {
      if (this.shouldRefresh) {
        if (this.hasChanged) {
          this.hasChanged = false
          this.updatePublic()
        }
        Helpers.requestUpdateFrame(UpdateMessages)
      }
    }
    Helpers.requestUpdateFrame(UpdateMessages)
  }
<<<<<<< HEAD
  set({linter, messages, editorLinter}) {
    if (linter.deactivated) {
      return
    }
    try {
      Validate.messages(messages, linter)
    } catch (e) { return Helpers.error(e) }
    messages = messages.filter(i => this.ignoredMessageTypes.indexOf(i.type) === -1)
    if (linter.scope === 'file') {
      if (!editorLinter) {
        throw new Error('Given editor is not really an editor')
      }
      if (!editorLinter.editor.isAlive()) {
        return
      }
      if (!this.messages.has(editorLinter)) {
        this.messages.set(editorLinter, new Map())
      }
      this.messages.get(editorLinter).set(linter, messages)
=======
  set({linter, messages, editor}) {
    if (linter.deactivated) return
    try {
      Validate.messages(messages)
    } catch (e) { return Helpers.error(e) }
    messages = messages.filter(i => this.ignoredMessageTypes.indexOf(i.type) === -1)
    if (linter.scope === 'file') {
      if (!editor.alive) return
      if (!(editor instanceof TextEditor)) throw new Error("Given editor isn't really an editor")
      if (!this.editorMessages.has(editor))
        this.editorMessages.set(editor, new Map())
      this.editorMessages.get(editor).set(linter, messages)
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
    } else { // It's project
      this.linterResponses.set(linter, messages)
    }
    this.hasChanged = true
  }
  updatePublic() {
    let latestMessages = []
    let publicMessages = []
    let added = []
    let removed = []
    let currentKeys
    let lastKeys

    this.linterResponses.forEach(messages => latestMessages = latestMessages.concat(messages))
<<<<<<< HEAD
    this.messages.forEach(bufferMessages =>
      bufferMessages.forEach(messages => latestMessages = latestMessages.concat(messages))
=======
    this.editorMessages.forEach(editorMessages =>
      editorMessages.forEach(messages => latestMessages = latestMessages.concat(messages))
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
    )

    currentKeys = latestMessages.map(i => i.key)
    lastKeys = this.publicMessages.map(i => i.key)

    for (let i of latestMessages) {
      if (lastKeys.indexOf(i.key) === -1) {
        added.push(i)
        publicMessages.push(i)
      }
    }

    for (let i of this.publicMessages)
<<<<<<< HEAD
      if (currentKeys.indexOf(i.key) === -1) {
        removed.push(i)
      } else publicMessages.push(i)
=======
      if (currentKeys.indexOf(i.key) === -1)
        removed.push(i)
      else
        publicMessages.push(i)
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566

    this.publicMessages = publicMessages
    this.emitter.emit('did-update-messages', {added, removed, messages: publicMessages})
  }
  onDidUpdateMessages(callback) {
    return this.emitter.on('did-update-messages', callback)
  }
  deleteMessages(linter) {
    if (linter.scope === 'file') {
<<<<<<< HEAD
      this.messages.forEach(r => r.delete(linter))
=======
      this.editorMessages.forEach(r => r.delete(linter))
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
      this.hasChanged = true
    } else if(this.linterResponses.has(linter)) {
      this.linterResponses.delete(linter)
      this.hasChanged = true
    }
  }
<<<<<<< HEAD
  deleteEditorMessages(editorLinter) {
    if (this.messages.has(editorLinter)) {
      this.messages.delete(editorLinter)
      this.hasChanged = true
    }
=======
  deleteEditorMessages(editor) {
    if (!this.editorMessages.has(editor)) return
    this.editorMessages.delete(editor)
    this.hasChanged = true
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
  }
  dispose() {
    this.shouldRefresh = false
    this.subscriptions.dispose()
    this.linterResponses.clear()
<<<<<<< HEAD
    this.messages.clear()
=======
    this.editorMessages.clear()
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
  }
}

module.exports = MessageRegistry
