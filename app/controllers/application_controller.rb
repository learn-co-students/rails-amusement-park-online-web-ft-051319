class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :authentication_required, :log_in, :current_user

  def authentication_required
    redirect_to root_path unless session.include? :user_id
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def reset_session
    session.delete(:user_id)
    @current_user = nil
  end

  def is_admin?
    redirect_to user_path(current_user) unless current_user.admin
  end
end
