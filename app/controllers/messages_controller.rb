class MessagesController < ApplicationController

  def create
    # First create the message and assign the user.
    message = Message.new(params[:message].permit!)
    message.user = current_user
    message.save

  end
end
