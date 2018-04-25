require "test_helper"

describe SessionsController do
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end
  describe 'auth_callback' do
    it 'creates a DB entry for a new user' do
      #arrange
      user = User.new(
        provider: 'github',
        uid: 80085,
        email: 'test@tester.com',
        name: 'test user'
      )
      user.must_be :valid?
      old_user_count = User.count

      login(user)
      User.count.must_equal old_user_count + 1
      session[:user_id].must_equal User.last.id
    end

    it 'logs in an existing user' do
      #arrange
      user = User.first
      old_user_count = User.count

      login(user
      )
      User.count.must_equal old_user_count
      session[:user_id].must_equal user.id
    end

    it 'does not log in with insufficient data' do
      #Auth hash does not include a uid
      user = User.new(
        uid: 80085,
        email: 'test@tester.com',
        name: 'test user'
      )

    end

    it 'does not log in if the user data is invalid' do
      #validation fails
    end

    #what about if the user is already logged in?
  end
end
