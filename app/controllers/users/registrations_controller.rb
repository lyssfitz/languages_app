# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :set_listings

  # GET /resource/sign_up
  def new
    super
    set_listings = true
    @disable_nav
  end

  # POST /resource
  def create
    super
    unless !current_user
      UsersLanguage.create(
        user_id: current_user.id,
        language_id: params[:user][:languages]
      )
    end
  end

  # GET /resource/edit
  def edit
    super
  end

  def set_listings
    @city = "Sydney, Australia"
    @languages = Language.all
    @gender = User.genders.keys
    @roles = User.roles.keys
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, :first_name)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end


  def after_sign_up_path_for(resource)
    super(resource)
    lessons_path
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
    home_path
  end
end
