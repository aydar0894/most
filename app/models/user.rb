class User < ApplicationRecord
	enum role: [:user, :doctor, :organizer, :operator, :admin]
	after_initialize :set_default_role, :if => :new_record?

	def set_default_role
		self.role ||= :user
	end

	def name
		case self.role
		when "doctor"
			doctor = Doctor.find_by(user_id: self.id)
			return "#{doctor.first_name} #{doctor.last_name}"
		when "organizer"
			organizer = Organizer.find_by(user_id: self.id)
			return "#{organizer.company_name}"
		when "operator"
			operator = Operator.find_by(user_id: self.id)
			return "#{operator.first_name} #{operator.last_name}"
		else
			return 'Профиль'
		end
	end

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :trackable, :validatable

	def self.registration_roles
		return [:doctor, :organizer]
	end

end
