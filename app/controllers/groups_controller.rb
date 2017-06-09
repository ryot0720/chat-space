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
         flash[:notice] = "グループを作成しました"
         redirect_to root_path
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
      redirect_to root_path
    else
      session[:errors] = @group.errors.full_messages
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, { user_ids:[] })
  end

  def edit_group
    @group = Group.find(params[:id])
  end
end
