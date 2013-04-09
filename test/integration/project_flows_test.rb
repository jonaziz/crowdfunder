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
  
    # Alternative to test product link / page
    click_link 'Waterproof Whiteboard'
    assert_equal project_path(p2), current_path
    assert find('h1:first').has_content? p2.title

  end

  test "navigation update" do
    visit '/'
    assert_equal root_path, current_path

    assert_equal "Home", find('ul.nav li.active').text

    visit '/projects'
    assert_equal projects_path, current_path

    assert_equal "Projects", find('ul.nav li.active').text
  end

  # Alternative above
  ## This is less correct, especially due to the h1 checl
  ## because it appears on /projects
  # test "project link goes to project" do
  #   p1 = FactoryGirl.create(:project)

  #   visit '/projects'
  #   assert_equal project_path(p1), first('ul.project-list li a')['href']
  #   assert page.has_content?(p1.title)
  # end

end
