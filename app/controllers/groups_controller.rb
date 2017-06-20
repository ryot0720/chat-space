class GroupsController < ApplicationController
  before_action :edit_group, only: [:edit, :update]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
      if @group.save
         redirect_to root_path(@group.id), notice: "グループを作成しました"
      else
        session[:errors] = @group.errors.full_messages
        render :new
      end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      flash[:notice] = "チャットグループが更新されました"
      redirect_to new_group_message_path(@group)
    else
      session[:errors] = @group.errors.full_messages
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end

  def edit_group
    @group = Group.find(params[:id])
  end
end
