# RSpec without Rails
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include Warden::Test::Helpers
  
  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
