class Users::RegistrationsController < Devise::RegistrationsController
  layout :set_layout

  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    render :edit, layout: 'application', resource: current_user, resource_name: 'User'
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

  def set_layout
    %w(edit update).include?(action_name) ? 'application' : 'devise'
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    allowed_attributes = [:name, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: allowed_attributes)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    allowed_attributes = [:name, :email, :current_password, :password, :password_confirmation]
    devise_parameter_sanitizer.permit(:account_update, keys: allowed_attributes)
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    carousels_path
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    edit_user_registration_path(resource)
  end

  def after_update_path_for(resource)
    edit_user_registration_path(resource)
  end
end
