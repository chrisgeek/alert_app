class ApplicationController < ActionController::API
  def jsonapi_response(resource)
    if resource.errors.empty?
      render jsonapi: resource
    else
      render jsonapi_errors: resource.errors, status: 400
    end
  end

  def jsonapi_error_response(resource)
    render jsonapi_errors: resource.errors, status: 400
  end

  def jsonapi_success_response(resource)
    render jsonapi: resource
  end

end
