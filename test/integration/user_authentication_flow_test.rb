require 'test_helper'

class UserAuthenticationFlowTest < ActionDispatch::IntegrationTest

	test "successful registration" do 
  	visit "/users/new"
  	assert_equal new_user_path, current_path

  	# The signup button should be visible unless already signed in
  	assert find('.navbar').has_link?('Sign Up')

  	user = FactoryGirl.build(:user) 

  	fill_in "user[email]", :with => user.email
  	fill_in "user[first_name]", :with => user.first_name
  	fill_in "user[last_name]", :with => user.last_name
  	fill_in "user[password]", :with => user.password
  	click_button "Create Account"

  	assert_equal root_path, current_path
  	assert page.has_content?("Account created")

  	# No sign up button, logout button instead
  	assert find('.navbar').has_no_link?('Sign Up')
  	assert find('.navbar').has_link?('Logout')
  end

  test "failed registration" do 
  	visit "/users/new"
		user = FactoryGirl.build(:user) 

		fill_in "user[email]", :with => user.email
		click_button "Create Account"
		assert_equal users_path, current_path
		assert page.has_no_content?("Account created")

    assert find('.alert:first').has_content?("Try again")
  end

  test "logout" do
    Capybara.current_driver = Capybara.javascript_driver
    user = get_signed_in_user

    ## Need to be sure to use a js-ready driver
    visit '/projects'
    click_link 'Logout'

    assert_equal root_path, current_path
    ## Explicity return to default driver if not in setup
  end

  test "log in" do 
    get_signed_in_user 
    assert_equal root_path, current_path
    assert find('.navbar').has_link?('Logout')
  end
end