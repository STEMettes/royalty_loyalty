class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :authenticate_user!, :except => [:pre_signin]

  def admin_auth
    if current_user.admin == true then
      redirect_to rails_admin_path
    end
  end

end
