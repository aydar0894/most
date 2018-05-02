require 'rails_helper'

RSpec.describe Organizer, type: :model do

  subject {FactoryBot.build(:organizer)}

  context "company name" do
    it "is present" do
      expect(subject.company_name).not_to be_nil
    end

    it "has minimum length - 3" do
      operator = subject.dup
      operator.company_name = 'a' * 3
      expect(operator.company_name.length >= 3).to be true
      operator.company_name = 'a' * 2
      expect(operator.company_name.length >= 3).to be false
    end

    it "has maximum length - 100" do
      operator = subject.dup
      operator.company_name = 'a' * 100
      expect(operator.company_name.length <= 100).to be true
      operator.company_name = 'a' * 101
      expect(operator.company_name.length <= 100).to be false
    end
  end

end
