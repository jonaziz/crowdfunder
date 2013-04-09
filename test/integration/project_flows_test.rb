require 'test_helper'

class ProjectFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "the index page lists all our projects" do
  	# Ideally, this test should create several projects in DB (via FG)
  	p1 = FactoryGirl.create(:project)
  	p2 = FactoryGirl.create(:project, title: "Waterproof Whiteboard")
  	p3 = FactoryGirl.create(:project, title: "Something Else")

  	visit '/projects'
  	assert page.has_content?('Project Listing')

  	assert page.has_content?('WiFi-sniffing Shoes')
  	assert page.has_content?('Waterproof Whiteboard')
  	assert page.has_content?('Something Else')
  	# Also assert that the tests we visit has the created projects listed
  end

  test "navigation update" do
    visit '/'
    assert_equal root_path, current_path

    assert_equal "Home", find('ul.nav li.active').text

    visit '/projects'
    assert_equal projects_path, current_path

    assert_equal "Projects", find('ul.nav li.active').text
  end

end
