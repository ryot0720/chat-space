class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
        redirect_to :root, notice: "編集が完了しました！"
    else
        flash[:alert] = "編集に失敗しました"
        render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email)
  end
end
