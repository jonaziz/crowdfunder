ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  # fixtures :all

  # Add more helper methods to be used by all tests here...

  # Adding something else to include with ActionDispatch Integration Testing
  class ActionDispatch::IntegrationTest
  	include Capybara::DSL
    Capybara.app = Crowdfunder::Application

    teardown do
      Capybara.reset_sessions!    # Forget the (simulated) browser state
      Capybara.use_default_driver # Revert Capybara.current_driver to Capybara.default_driver
    end

  end
end
