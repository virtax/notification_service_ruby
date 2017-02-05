@Message = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.message.id
      React.DOM.td null, @props.message.recipients
      React.DOM.td null, @props.message.subject
      React.DOM.td null, @props.message.body