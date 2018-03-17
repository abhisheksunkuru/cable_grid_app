jQuery(document).on 'turbolinks:load', ->
  tiles = $('.tiles-list')

  App.global_chat = App.cable.subscriptions.create {
    channel: "ChatRoomsChannel"

    },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      # Data received
      tiles.empty()
      tiles.append(data['message'])

    send_message: (palete) ->
      @perform 'send_message', palete: palete


