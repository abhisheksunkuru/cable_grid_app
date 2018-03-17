class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_rooms_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    # process data sent from the page
    user = User.find(data['palete']['user_id'])
    position = data['palete']['tiles'].split("-")[1].split("_")
    user.paletes.create(code: data['palete']['color_code'],row: position[0],column: position[1])
    #user.paletes.create!(body: data['message'], chat_room_id: data['chat_room_id'])
  end
end