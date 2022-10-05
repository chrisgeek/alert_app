class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)
    if resource.save
      sign_up(resource_name, resource) if resource.persisted?
      jsonapi_success_response(resource)
    else
      jsonapi_error_response(resource)
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:role, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:role, :email, :password, :password_confirmation, :current_password)
  end
end
