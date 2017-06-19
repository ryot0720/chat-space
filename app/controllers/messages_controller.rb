class MessagesController < ApplicationController
  before_action :get_group

  def new
    @message = Message.new
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to new_group_message_path}
        flash[:notice] = "メッセージが送信されました"
        format.json
      end
    else
      flash.now[:alert] = " メッセージを入力してください"
      redirect_to new_group_message_path(params[:group_id])
    end
  end

  private
  def get_group
    @messages = Group.find(params[:group_id]).messages
    @groups = current_user.groups.includes(:messages)
    @group = Group.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(:text, :avatar).merge(user_id: current_user.id)
  end
end
