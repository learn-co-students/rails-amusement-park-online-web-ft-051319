module ApplicationHelper

  def admin?
    @user=User.find(session[:user_id])
    @user.admin
  end

end
