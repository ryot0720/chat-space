class MessagesController < ApplicationController
  before_action :get_group

  def new
    @message = Message.new
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      redirect_to new_group_message_path, notice: "メッセージが送信されました"
    else
      flash.now[:alert] = " メッセージを入力してください"
      render :new
    end
  end

  private
  def get_group
    @messages = Group.find(params[:group_id]).messages
    @groups = current_user.groups.includes(:messages)
    @group = Group.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(:text, :avatar)
  end
end
