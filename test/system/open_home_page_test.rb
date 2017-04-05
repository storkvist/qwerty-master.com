require 'application_system_test_case'

class OpenHomePageTest < ApplicationSystemTestCase
  test 'visiting the home page' do
    visit root_url

    assert_current_path '/'
  end
  # test "visiting the index" do
  #   visit open_home_pages_url
  #
  #   assert_selector "h1", text: "OpenHomePage"
  # end
end
