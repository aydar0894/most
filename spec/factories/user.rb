FactoryBot.define do
    factory :user do
        phone '+79964458833'
        email 'test@example.com'
        password 'secretpass123'
        role :user
        # if needed
        # is_active true
    end
  end