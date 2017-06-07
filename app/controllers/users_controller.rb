class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
        flash[:notice] = "編集が完了しました！"
        redirect_to :root
    else
        flash[:notice] = "編集に失敗しました"
        redirect_to action: :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email)
  end
end
