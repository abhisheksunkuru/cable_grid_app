class DashboardController < ApplicationController
  before_action :set_user_info

  def index

  end

  def leaderboard
    @users = User.joins(:paletes)
                 .select("users.*, count(paletes.id) as scount")
                 .group("users.id")
                 .order("scount DESC")
  end

  private

  def set_user_info
    user = User.where(ip_addr: request.remote_ip).last
    if user.present?
      @user = user
    else
      username = "Anonymous#{User.count+1}-#{DateTime.now.to_i}"
      @user = User.create(username: username,ip_addr: request.remote_ip)
    end
  end
end
