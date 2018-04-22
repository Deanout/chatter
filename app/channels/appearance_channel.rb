class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "appearance"

    if current_user
      current_user.online = true
      current_user.save!
      ActionCable.server.broadcast "appearance", {
        user: current_user.id, online: :on,
        users: User.where(online: true).count
      }

    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    if current_user
      current_user.online = false
      current_user.save!
      ActionCable.server.broadcast "appearance", {
        user: current_user.id, online: :off,
        users: User.where(online: true).count
      }

    end
  end
end
