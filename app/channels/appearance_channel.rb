class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_for "appearance"
    
    if current_user
    	ActionCable.server.broadcast "appearance", {
    		user: current_user.id, online: :on
    	}
    	current_user.online = true
    	current_user.save!
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    if current_user
    	ActionCable.server.broadcast "appearance", {
    		user: current_user.id, online: :off
    	}
    	current_user.online = false
    	current_user.save!
    end
  end
end
