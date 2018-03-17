class PaleteBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chat_rooms_channel",
                                 message: render_message(message)
  end

  private

  def render_message(message)
    DashboardController.render partial: 'dashboard/list', locals: {user_id: message.user.id}
  end
end