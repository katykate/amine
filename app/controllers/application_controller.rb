class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception

	  rescue_from CanCan::AccessDenied do |exception|
	  redirect_to products_index_path, notice: exception.message
	end

	def redirect_if_no_user
    if current_user.nil?
      redirect_to root_path
    end
  end

end
