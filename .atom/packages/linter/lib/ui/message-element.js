'use babel'

const NewLine = /\r?\n/

export class Message extends HTMLElement {
<<<<<<< HEAD
  initialize(message, includeLink = true) {
    this.message = message
    this.includeLink = includeLink
    this.scope = 'Project'
    return this
  }
  updateVisibility(scope) {
    const visibility = scope === 'Line' ? Boolean(this.message.currentLine && this.message.currentFile) : true
    if (this.scope !== scope) {
      const link = this.querySelector('.linter-message-link span')
      if (link) {
        if (scope === 'Project') {
          link.removeAttribute('hidden')
        } else link.setAttribute('hidden', true)
      }
      this.scope = scope
    }
    if (visibility !== this.visibility) {
      if (visibility) {
        this.removeAttribute('hidden')
      } else this.setAttribute('hidden', true)
      this.visibility = visibility
    }
    return this
  }
  attachedCallback() {
    if (!this.childNodes.length) {
      if (atom.config.get('linter.showProviderName') && this.message.linter) {
        this.appendChild(Message.getName(this.message))
      }
      this.appendChild(Message.getRibbon(this.message))
      this.appendChild(Message.getMessage(this.message, this.includeLink))
=======
  initialize(message) {
    this.message = message
    return this
  }
  updateVisibility(scope) {
    let status = true
    if (scope === 'Line')
      status = this.message.currentLine
    else if (scope === 'File')
      status = this.message.currentFile

    if (this.children.length && this.message.filePath)
      if (scope === 'Project')
        this.children[this.children.length - 1].children[0].removeAttribute('hidden')
      else this.children[this.children.length - 1].children[0].setAttribute('hidden', true)

    if (status)
      this.removeAttribute('hidden')
    else
      this.setAttribute('hidden', true)
  }
  attachedCallback() {
    this.appendChild(Message.getRibbon(this.message))
    this.appendChild(Message.getMessage(this.message))

    if (this.message.filePath) {
      this.appendChild(Message.getLink(this.message))
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
    }
  }
  static getLink(message) {
    const el = document.createElement('a')
    const pathEl = document.createElement('span')
<<<<<<< HEAD

    el.className = 'linter-message-link'
    if (message.range) {
      el.textContent = `at line ${message.range.start.row + 1} col ${message.range.start.column + 1}`
    }
    pathEl.textContent = ' in ' + atom.project.relativizePath(message.filePath)[1]
    el.appendChild(pathEl)
    el.addEventListener('click', function() {
      atom.workspace.open(message.filePath).then(function() {
=======
    let displayFile = message.filePath

    el.className = 'linter-message-item'

    for (let path of atom.project.getPaths())
      if (displayFile.indexOf(path) === 0) {
        displayFile = displayFile.substr(path.length + 1) // Path + Path Separator
        break
      }

    if (message.range) {
      el.textContent = `at line ${message.range.start.row + 1} col ${message.range.start.column + 1}`
    }
    pathEl.textContent = ' in ' + displayFile
    el.appendChild(pathEl)
    el.addEventListener('click', function(){
      atom.workspace.open(message.filePath).then(function(){
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
        if (message.range) {
          atom.workspace.getActiveTextEditor().setCursorBufferPosition(message.range.start)
        }
      })
    })
    return el
  }
<<<<<<< HEAD
  static getMessage(message, includeLink) {
    if (message.multiline || NewLine.test(message.text)) {
      return Message.getMultiLineMessage(message, includeLink)
    }

    const el = document.createElement('span')
    const messageEl = document.createElement('linter-message-line')

    el.className = 'linter-message-item'

    el.appendChild(messageEl)

    if (includeLink && message.filePath) {
      el.appendChild(Message.getLink(message))
    }

    if (message.html && typeof message.html !== 'string') {
      messageEl.appendChild(message.html.cloneNode(true))
    } else if (message.html) {
      messageEl.innerHTML = message.html
    } else if (message.text) {
      messageEl.textContent = message.text
    }

    return el
  }
  static getMultiLineMessage(message, includeLink) {
    const container = document.createElement('span')
    const messageEl = document.createElement('linter-multiline-message')

    container.className = 'linter-message-item'
    messageEl.setAttribute('title', message.text)

    message.text.split(NewLine).forEach(function(line, index) {
      if (!line) return

      const el = document.createElement('linter-message-line')
      el.textContent = line
      messageEl.appendChild(el)

      // Render the link in the "title" line.
      if (index === 0 && includeLink && message.filePath) {
        messageEl.appendChild(Message.getLink(message))
      }
    })

    container.appendChild(messageEl)

    messageEl.addEventListener('click', function(e) {
      // Avoid opening the message contents when we click the link.
      var link = e.target.tagName === 'A' ? e.target : e.target.parentNode

      if (!link.classList.contains('linter-message-link')) {
        messageEl.classList.toggle('expanded')
      }
    })

    return container
  }
  static getName(message) {
    const el = document.createElement('span')
    el.className = 'linter-message-item badge badge-flexible linter-highlight'
    el.textContent = message.linter
    return el
  }
=======
  static getMessage(message) {
    const el = document.createElement('span')
    el.className = 'linter-message-item'
    if (message.html && typeof message.html !== 'string') {
      el.appendChild(message.html.cloneNode(true))
    } else if (
      message.multiline ||
      (message.html && message.html.match(NewLine)) ||
      (message.text && message.text.match(NewLine))
    ) {
      return Message.getMultiLineMessage(message.html || message.text)
    } else {
      if (message.html) {
        el.innerHTML = message.html
      } else if (message.text) {
        el.textContent = message.text
      }
    }
    return el
  }
  static getMultiLineMessage(message) {
    const container = document.createElement('linter-multiline-message')
    for (let line of message.split(NewLine)) {
      if (!line) continue
      const el = document.createElement('linter-message-line')
      el.textContent = line
      container.appendChild(el)
    }
    return container
  }
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
  static getRibbon(message) {
    const el = document.createElement('span')
    el.className = `linter-message-item badge badge-flexible linter-highlight ${message.class}`
    el.textContent = message.type
    return el
  }
<<<<<<< HEAD
  static fromMessage(message, includeLink) {
    return new MessageElement().initialize(message, includeLink)
=======
  static fromMessage(message) {
    return new MessageElement().initialize(message)
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
  }
}

export const MessageElement = document.registerElement('linter-message', {
  prototype: Message.prototype
})
