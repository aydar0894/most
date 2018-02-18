class User < ApplicationRecord
	enum role: [:user, :doctor, :organizer, :operator, :admin]
	after_initialize :set_default_role, :if => :new_record?
	before_destroy :destroy_profile

	validates :attribute, phone: { possible: true, allow_blank: false, types: [:mobile])

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
		return [:doctor, :organizer, :operator]
	end

	def profile
		case self.role.to_sym
		when :doctor
			return Doctor.find_by(user_id: self.id)
		when :organizer
			return Organizer.find_by(user_id: self.id)
		when :operator
			return Operator.find_by(user_id: self.id)
		when :admin
			return self
		when :user
			return self
		end
	end

	def destroy_profile
		self.profile&.destroy
	end

end
