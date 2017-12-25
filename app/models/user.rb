class User < ApplicationRecord
	enum role: [:user, :doctor, :organizer, :operator, :admin]
	after_initialize :set_default_role, :if => :new_record?

	

	def set_default_role
		self.role ||= :user
	end



	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, 
				 :recoverable, :rememberable, :trackable, :validatable

	def is_admin
		return false if self.role != "admin"
		return true
	end

	def is_doctor   
		return false if self.role != "doctor"
		return true
	end

	def is_organizer      
		return false if self.role != "organizer"
		return true
	end
end
