class MessagesController < ApplicationController
  def new
  end

  def create
  end

  private
  def avatar_params
    params.require(:message).permit(:text, :image)
  end
end
