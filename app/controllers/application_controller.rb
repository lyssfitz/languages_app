class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!, except: [:index, :stripe]

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :date_of_birth, :gender, :city, :biography, :role, :picture)}
        devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :current_password, :date_of_birth, :gender, :city, :biography, :role, :picture)}
        devise_parameter_sanitizer.permit(:lesson) { |u| u.permit(:language_id, :body, :lesson_date, :lesson_time, :street, :city, :state, :postcode, :price, :max_students, :difficulty)}
    end
    
    def after_sign_in_path_for(resource)
        if current_user.role == "teacher"
            lessons_path
        else 
            explore_path
        end
    end

    def after_sign_up_path_for(resource)
        super(resource)
        if current_user.role == "teacher"
          lessons_path
        else 
          explore_path
        end
    end

    
end
