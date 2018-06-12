module ApiHelpers
    def json_body
        JSON.parse(response.body)
    end

    def login(user)
        ActionController::IntegrationTest.new(self).open_session do |sess|
          u = users(user)
    
          sess.post '/users/sign_in', {
            user: {
              email: u.email,
              password: 'password'
            }
          }
    
          sess.flash[:alert].should be_nil
          sess.flash[:notice].should == 'Signed in successfully.'
          sess.response.code.should == '302'
        end
    end
end
  
RSpec.configure do |config| 
    config.include ApiHelpers, type: :request
end
