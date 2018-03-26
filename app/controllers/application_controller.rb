class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :authenticate_user!
  before_action :auth

  private
  
  def auth
    return if controller_name == 'contacts'
  	return if controller_name == 'reports' && 
  			  (action_name == 'create' || action_name == 'new')
    authenticate_user!
  end

  def after_sign_in_path_for(res)
  	reports_path
  end

end
