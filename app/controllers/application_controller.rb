class ApplicationController < ActionController::Base
  protected

  def after_sign_in_path_for(resource)
    company_path(resource.company)
  end
end
