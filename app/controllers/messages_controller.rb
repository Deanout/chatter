class MessagesController < ApplicationController

  def create
    # First create the message and assign the user.
    message = Message.new(params[:message].permit!)
    message.user = current_user
    message.save

  end

  def destroy
  	Message.find(params[:id]).destroy
  	respond_to do |format|
	  format.js { render "destroy", :locals => {:id => params[:id]} }
	end
  end
end
