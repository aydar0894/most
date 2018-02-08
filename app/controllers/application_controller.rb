class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :nav_item_active

  def nav_item_active(current, need)
    return 'active' if current == need
    return ''
  end

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

    def only_admin_or_organizer
      return redirect_to root_path if !current_user or !current_user.organizer? or !current_user.admin?
    end

  	def only_user
  		return redirect_to root_path if !current_user
  	end

end
