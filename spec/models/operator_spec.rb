require 'rails_helper'

RSpec.describe Operator, type: :model do

  subject {FactoryBot.build(:operator)}

  context "first name" do
    it "is present" do
      expect(subject.first_name).not_to be_nil
    end

    it "has minimum length - 2" do
      operator = subject.dup
      operator.first_name = 'a' * 2
      expect(operator.first_name.length >= 2).to be true
      operator.first_name = 'a'
      expect(operator.first_name.length >= 2).to be false
    end

    it "has maximum length - 30" do
      operator = subject.dup
      operator.first_name = 'a' * 30
      expect(operator.first_name.length <= 30).to be true
      operator.first_name = 'a' * 31
      expect(operator.first_name.length <= 30).to be false
    end
  end

  context "last name" do
    it "is present" do
      expect(subject.last_name).not_to be_nil
    end

    it "has minimum length - 2" do
      operator = subject.dup
      operator.last_name = 'a' * 2
      expect(operator.last_name.length >= 2).to be true
      operator.last_name = 'a'
      expect(operator.last_name.length >= 2).to be false
    end

    it "has maximum length - 30" do
      operator = subject.dup
      operator.last_name = 'a' * 30
      expect(operator.last_name.length <= 30).to be true
      operator.last_name = 'a' * 31
      expect(operator.last_name.length <= 30).to be false
    end
  end

  context "middle name" do
    it "is present" do
      expect(subject.middle_name).not_to be_nil
    end

    it "has minimum length - 2" do
      operator = subject.dup
      operator.middle_name = 'a' * 2
      expect(operator.middle_name.length >= 2).to be true
      operator.middle_name = 'a'
      expect(operator.middle_name.length >= 2).to be false
    end

    it "has maximum length - 30" do
      operator = subject.dup
      operator.middle_name = 'a' * 30
      expect(operator.middle_name.length <= 30).to be true
      operator.middle_name = 'a' * 31
      expect(operator.middle_name.length <= 30).to be false
    end
  end

end
