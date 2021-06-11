class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(visited_id: current_user.id).where.not(visitor_id: current_user.id)
  end
end
