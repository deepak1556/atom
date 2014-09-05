{last, isEqual} = require 'underscore-plus'
mercury = require 'mercury'
h = mercury.h

module.exports = InputComponent = render

events = mercury.input 'paste', 'compositionUpdate', 'componentDidUpdate'
state = mercury.hash({
    lastChar: mercury.value '' ,
    domNodeValue: @getDOMNode().value
  })

events.componentDidUpdate(componentDidUpdate.bind(null, state))

render = ->
  {className, style, onFocus, onBlur} = @props

   h('input', {
       'data-event': mercury.changeEvent(componentDidUpdate),
       className: @props.className,
       style: @props.style,
       last
     })

componentDidUpdate ->
  if @lastValueLength > 500 and not isPressAndHoldCharacter(state.lastChar)
    state.domNodeValue.set('');
    @lastValueLength = 0

isPressAndHoldCharacter (char) ->
  state.lastChar.match /[aeiouAEIOU]/
