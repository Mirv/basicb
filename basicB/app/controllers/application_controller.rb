class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # This might need to be rescue => e at some point
  # rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  
    # strong_param permits
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # checks auth except on splash screen
  before_action :authenticate_user!

  # saves the location before loading each page so we can return to the
  # right page. If we're on a devise page, we don't want to store that as the
  # place to return to (for example, we don't want to return to the sign in page
  # after signing in), which is what the :unless prevents
  before_action :store_current_location, :unless => :devise_controller?
  
  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:update_account, keys: [:username, :name])
      devise_parameter_sanitizer.permit(:account_update) { 
        |u| u.permit(:name, :email, :password, :current_password) }
    end
  
  private
    #protect from no ID in params
    def record_not_found
      puts "RecordNotFound"
      redirect_to request.referrer || root_path
    end
    # Version 2 from https://blog.rebased.pl/2016/11/07/api-error-handling.html
    def render_unprocessable_entity_response(exception)
            puts "RecordNotFound -- unprocessable_entity response"

      render json: exception.record.errors, status: :unprocessable_entity
    end
  
    def render_not_found_response(exception)
            puts "RecordNotFound -- not found response"

      render json: { error: exception.message }, status: :not_found
    end
  
    # override the devise helper to store the current location so we can
    # redirect to it after loggin in or out. This override makes signing in
    # and signing up work automatically.
    def store_current_location
      store_location_for(:user, request.url)
    end
    
    # override the devise method for where to go after signing out because theirs
    # always goes to the root path. Because devise uses a session variable and
    # the session is destroyed on log out, we need to use request.referrer
    # root_path is there as a backup
    def after_sign_out_path_for(resource)
      request.referrer || root_path
    end  
end
