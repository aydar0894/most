require 'rails_helper'

RSpec.describe Doctor, type: :model do

  subject {FactoryBot.build(:doctor)}

  context "first name" do
    it "is present" do
      expect(subject.first_name).not_to be_nil
    end

    it "has minimum length - 2" do
      doctor = subject.dup
      doctor.first_name = 'a' * 2
      expect(doctor.first_name.length >= 2).to be true
      doctor.first_name = 'a'
      expect(doctor.first_name.length >= 2).to be false
    end

    it "has maximum length - 30" do
      doctor = subject.dup
      doctor.first_name = 'a' * 30
      expect(doctor.first_name.length <= 30).to be true
      doctor.first_name = 'a' * 31
      expect(doctor.first_name.length <= 30).to be false
    end
  end

  context "last name" do
    it "is present" do
      expect(subject.last_name).not_to be_nil
    end

    it "has minimum length - 2" do
      doctor = subject.dup
      doctor.last_name = 'a' * 2
      expect(doctor.last_name.length >= 2).to be true
      doctor.last_name = 'a'
      expect(doctor.last_name.length >= 2).to be false
    end

    it "has maximum length - 30" do
      doctor = subject.dup
      doctor.last_name = 'a' * 30
      expect(doctor.last_name.length <= 30).to be true
      doctor.last_name = 'a' * 31
      expect(doctor.last_name.length <= 30).to be false
    end
  end

  context "middle name" do
    it "is present" do
      expect(subject.middle_name).not_to be_nil
    end

    it "has minimum length - 2" do
      doctor = subject.dup
      doctor.middle_name = 'a' * 2
      expect(doctor.middle_name.length >= 2).to be true
      doctor.middle_name = 'a'
      expect(doctor.middle_name.length >= 2).to be false
    end

    it "has maximum length - 30" do
      doctor = subject.dup
      doctor.middle_name = 'a' * 30
      expect(doctor.middle_name.length <= 30).to be true
      doctor.middle_name = 'a' * 31
      expect(doctor.middle_name.length <= 30).to be false
    end
  end

  it "available events" do
    expected_count = Event.where.not(id: subject.events.ids).where("start > ?", Time.now).count
    expect(subject.events_available.count).to eq(expected_count)
  end

  it "pending events" do
    expected_count = subject.events.where("finish > ?", Time.now).count
    expect(subject.pending_events.count).to eq(expected_count)
  end

  it "archive events" do
    expected_count = subject.events.where("finish < ?", Time.now).count
    expect(subject.archive_events.count).to eq(expected_count)
  end

  it "full_name" do
    expect(subject.full_name).to eq("#{subject.last_name} #{subject.first_name} #{subject.middle_name}")
  end
end
