require 'rails_helper'

RSpec.describe User, type: :model do

  subject {FactoryBot.build(:user)}

  context "phone number" do
    it "is valid" do
      expect(/^[+]?[78]\d{10}$/ =~ subject.phone).not_to be_nil
    end

    it "is not valid" do
      phone = "99000000000"
      expect(/^[+]?[78]\d{10}$/ =~ phone).to be_nil
    end

    it "could start with +7 or 8" do
      phone = "+79000000000"
      expect(/^[+]?[78]\d{10}$/ =~ phone).not_to be_nil
      phone = "89000000000"
      expect(/^[+]?[78]\d{10}$/ =~ phone).not_to be_nil
    end

    it "has not more than 11 digits" do
      expect(/^[+]?[78]\d{10}$/ =~ subject.phone + '1').to be_nil
    end

    it "has not less than 11 digits" do
      expect(/^[+]?[78]\d{10}$/ =~ subject.phone[0...-1]).to be_nil
    end
  end

  context "email" do
    it "is present" do
      expect(subject.email).not_to be_nil
    end
  end

  context "name" do
    context "of doctor" do
      it "is valid" do
        doctor = FactoryBot.create(:doctor)
        expect(doctor.user.name).to eq("#{doctor.first_name} #{doctor.last_name}")
      end
    end

    context "of organizer" do
      it "is valid" do
        organizer = FactoryBot.create(:organizer)
        expect(organizer.user.name).to eq("#{organizer.company_name}")
      end
    end

    context "of operator" do
      it "is valid" do
        operator = FactoryBot.create(:operator)
        expect(operator.user.name).to eq("#{operator.first_name} #{operator.last_name}")
      end
    end

    context "of the rest" do
      it "is valid" do
        user = FactoryBot.create(:user)
        expect(user.name).to eq("Профиль")
      end
    end
  end

  it "has 3 specific registration roles" do
    expect(User.registration_roles).to eq([:doctor, :organizer, :operator])
  end

  context "profile association" do
    context "of doctor" do
      it "is valid" do
        doctor = FactoryBot.create(:doctor)
        expect(doctor.user.profile.id).to eq(doctor.id)
      end
    end

    context "of organizer" do
      it "is valid" do
        organizer = FactoryBot.create(:organizer)
        expect(organizer.user.profile.id).to eq(organizer.id)
      end
    end

    context "of operator" do
      it "is valid" do
        operator = FactoryBot.create(:operator)
        expect(operator.user.profile.id).to eq(operator.id)
      end
    end

    context "of the rest" do
      it "is valid" do
        user = FactoryBot.create(:user)
        expect(user.profile.id).to eq(user.id)
      end
    end
  end

  it "destroys profile when deleted" do
    doctor = FactoryBot.create(:doctor)
    user = doctor.user
    user.destroy!
    expect(Doctor.find_by_id(doctor.id)).not_to be_present
  end

  it "sets default role" do
    doctor = FactoryBot.create(:doctor)
    expect(doctor.user.user?).to be false
    doctor.user.set_default_role
    expect(doctor.user.user?).to be true
  end

end
