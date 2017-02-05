@Messages = React.createClass
  getInitialState: ->
    messages: @props.data
  getDefaultProps: ->
    messages: []
  addMessage: (message) ->
    messages = @state.messages.slice()
    messages.push message
    @setState messages: messages
  render: ->
    React.DOM.div
      className: 'messages'
      React.DOM.h2
        className: 'title'
        'Messages'

      React.createElement MessageForm, handleNewMessage: @addMessage
      React.DOM.hr null

      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'ID'
            React.DOM.th null, 'Recipients'
            React.DOM.th null, 'Subject'
            React.DOM.th null, 'Body'
        React.DOM.tbody null,
          for message in @state.messages
            React.createElement Message, key: message.id, message: message

