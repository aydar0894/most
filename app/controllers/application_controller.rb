class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :nav_item_active
  helper_method :page_type_name

  def nav_item_active(current, need)
    return 'active' if current == need
    return ''
  end

  def page_type_name
    case current_user&.role
    when "doctor"
      return "Доктор"
    when "organizer"
      return "Организатор мероприятий"
    when "operator"
      return "Оператор"
    else
      return ''
    end
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

    def only_operator
      return redirect_to root_path if !current_user or !current_user.operator?
    end

    def only_admin_or_organizer
      return redirect_to root_path if !current_user or (!current_user.organizer? and !current_user.admin?)
    end

  	def only_user
  		return redirect_to root_path if !current_user
  	end

end
