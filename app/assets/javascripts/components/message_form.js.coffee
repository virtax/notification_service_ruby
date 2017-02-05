@MessageForm = React.createClass
  getInitialState: ->
    serviceUrl: '/messages'
    recipients: ''
    subject: ''
    body: ''
    result: ''
  handleSubmit: (e) ->
    e.preventDefault()
    message = Object.assign({}, @state)
    message.serviceUrl = undefined
    $.post @state.serviceUrl, { message: message }, (data) =>
      @state.result = JSON.stringify(data)
      if !data.error
        @props.handleNewMessage data
      @setState @setResultState(data)
    , 'JSON'
  setResultState: (data) ->
    result: JSON.stringify(data)
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.label
          'Notification Service URL: '
        React.DOM.br(null)
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Service URL'
          name: 'serviceUrl'
          value: @state.serviceUrl
          onChange: @handleChange
      React.DOM.br(null)
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Recipients'
          name: 'recipients'
          value: @state.recipients
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Subject'
          name: 'subject'
          value: @state.subject
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Body'
          name: 'body'
          value: @state.body
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Send'
      React.DOM.br(null)
      React.DOM.label
        'Result:'
      React.DOM.span
        children: @state.result

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  valid: ->
    @state.recipients && @state.subject && @state.body