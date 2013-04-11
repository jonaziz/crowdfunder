require 'test_helper'

class My::ProjectFlowsTest < ActionDispatch::IntegrationTest
	test "there is a my projects link in the nav bar" do
		get_signed_in_user
		visit "/"
		assert find('ul.nav').has_link?('My Projects')	
	end

	test "there is no my projects link in the nav bar when not signed in" do
		visit "/"
		refute find('ul.nav').has_link?('My Projects')	
	end

	test "the my projects link is active when I visit the my products page" do
		get_signed_in_user
		visit my_projects_url
		assert_equal find('ul.nav li.active a').text, "My Projects"
	end

	test "the my projects page lists all of my projects" do
		user = get_signed_in_user
		5.times { FactoryGirl.create(:project, :user => user) }
		other_user = FactoryGirl.create(:user)
		FactoryGirl.create(:project, :user => other_user, :title => "Not my Project")

		visit my_projects_url

		user.projects.each do |project|
			assert page.has_content?(project.title)
		end

		assert page.has_no_content?('Not my Project')
	end

	test "there is a new project button on my projects page" do
		get_signed_in_user
		visit my_projects_url
		assert page.has_link?('New Project')
	end


	test "the new project button directs to new action" do
		get_signed_in_user
		visit my_projects_url
		click_link('New Project')

		assert_equal new_my_project_path, current_path
	end

	test "a new project can be created with the new form" do
		get_signed_in_user
		visit new_my_project_path

		fill_in "project[title]", :with => "Amazing Invention"
	  	fill_in "project[teaser]", :with => "This will change the way you live your life."
	  	fill_in "project[description]", :with => "Never again will anything be the same."
	  	fill_in "project[goal]", :with => 12000

	  	click_button "Create Project"

	  	current_project = Project.all.last

	  	assert_equal my_project_path(current_project), current_path

	  	assert page.has_content?("Amazing Invention")

	  end

end