module ControllerMacros
  def login_admin
    before(:each) do
      admin = FactoryBot.create(:user)
      admin.role = :admin
      admin.save!
      sign_in admin
    end
  end

  def login_doctor
    before(:each) do
      doctor = FactoryBot.create(:user)
      doctor.role = :doctor
      doctor.save!
      sign_in doctor
    end
  end

  def login_organizer
    before(:each) do
      organizer = FactoryBot.create(:user)
      organizer.role = :organizer
      organizer.save!
      sign_in organizer
    end
  end

  def login_operator
    before(:each) do
      operator = FactoryBot.create(:user)
      operator.role = :operator
      operator.save!
      sign_in operator
    end
  end
end
