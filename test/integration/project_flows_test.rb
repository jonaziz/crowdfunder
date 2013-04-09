require 'test_helper'

class ProjectFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "the index page lists all our projects" do
  	# Ideally, this test should create several projects in DB (via FG)
  	visit '/projects'
  	assert page.has_content?('Project Listing')
  	# Also assert that the tests we visit has the created projects listed
  end

end
