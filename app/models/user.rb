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

	def self.registration_roles
		return [:doctor, :organizer, :operator]
	end

	def profile
		case self.role.to_sym
		when :doctor
			return Doctor.find_by(user_id: self.id)
		when :orginzer
			return Organizer.find_by(user_id: self.id)
		when :operator
			return Operator.find_by(user_id: self.id)
		when :admin
			return self
		when :user
			return self
		end
	end
end
