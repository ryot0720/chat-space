class GroupsController < ApplicationController
  def index
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
  end

  private
  def group_params
    params.require(:group).permit(:name, { user_ids:[] })
  end
end
