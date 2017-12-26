class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  	def only_doctor
  		return redirect_to root_path if !current_user or !current_user.doctor?
  	end

  	def only_admin
  		return redirect_to root_path if !current_user or !current_user.admin?
  	end

  	def only_organizer
  		return redirect_to root_path if !current_user or !current_user.organizer?
  	end

  	def only_user
  		return redirect_to root_path if !current_user
  	end
end
