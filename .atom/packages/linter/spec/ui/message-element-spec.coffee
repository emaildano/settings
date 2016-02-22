describe 'Message Element', ->
  {Message} = require('../../lib/ui/message-element')
  filePath = __dirname + '/fixtures/file.txt'

  getMessage = (type) ->
<<<<<<< HEAD
    return {type, text: 'Some Message', filePath}
=======
    return {type, text: "Some Message", filePath}
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
  visibleText = (element) ->
    cloned = element.cloneNode(true)
    Array.prototype.forEach.call(cloned.querySelectorAll('[hidden]'), (item) ->
      item.remove()
    )
    return cloned.textContent

  it 'works', ->
    message = getMessage('Error')
    messageElement = Message.fromMessage(message, 'Project')
    messageElement.attachedCallback()

    expect(visibleText(messageElement).indexOf(filePath) isnt -1).toBe(true)
<<<<<<< HEAD
=======
    messageElement.updateVisibility('File')
    expect(messageElement.hasAttribute('hidden')).toBe(true)

    message.currentFile = true
    messageElement.updateVisibility('File')
    expect(messageElement.hasAttribute('hidden')).toBe(false)
    expect(visibleText(messageElement).indexOf(filePath) is -1).toBe(true)
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566

    messageElement.updateVisibility('Line')
    expect(messageElement.hasAttribute('hidden')).toBe(true)
    message.currentLine = true
    messageElement.updateVisibility('Line')
<<<<<<< HEAD
    expect(visibleText(messageElement).indexOf(filePath) is -1).toBe(true)

  it 'plays nice with class attribute', ->
    message = getMessage('Error')
    message.class = 'Well Hello'
    messageElement = Message.fromMessage(message, 'Project')
    messageElement.attachedCallback()

    expect(messageElement.querySelector('.Well') instanceof Element).toBe(true)
    expect(messageElement.querySelector('.Hello') instanceof Element).toBe(true)
    expect(messageElement.querySelector('.haha')).toBe(null)
=======
    expect(messageElement.hasAttribute('hidden')).toBe(false)
    expect(visibleText(messageElement).indexOf(filePath) is -1).toBe(true)
>>>>>>> 880bd99b2ce454504a8f686e82d30dd0fafd9566
