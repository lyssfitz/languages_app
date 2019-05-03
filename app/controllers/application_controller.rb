class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!, except: [:index]

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :date_of_birth, :gender, :city, :biography, :role, :picture)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :current_password, :date_of_birth, :gender, :city, :biography, :role, :picture)}
    end

    def after_sign_in_path_for(resource)
        lessons_path
    end

    def after_sign_up_path_for(resource)
        lessons_path
    end
end
