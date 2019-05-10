# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :instant_variables_for_view

  # GET /resource/sign_up
  def new
    super
    @disable_nav = true
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

  def update
    super
    @users_language = UsersLanguage.find_by(user_id: current_user.id)
    p @users_language
    p params[:user][:languages]
    @users_language.update(
      language_id: params[:user][:languages]
    )
  end

  def instant_variables_for_view
    @city = "Sydney"
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
  # def configure_sign_up_params
  #     devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :date_of_birth, :gender, :city, :biography, :role, :picture)}
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :current_password, :date_of_birth, :gender, :city, :biography, :role, :picture)}
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  #
  # end

end
