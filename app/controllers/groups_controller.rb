class GroupsController < ApplicationController
  def index
    @groups = Group.all
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
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.save(group_params)
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

  private
  def group_params
    params.require(:group).permit(:name, { user_ids:[] })
  end
end
