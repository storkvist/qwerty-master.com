# frozen_string_literal: true

require 'application_system_test_case'

class OpenHomePageTest < ApplicationSystemTestCase
  test 'visiting the home page' do
    visit root_url

    assert_current_path '/'
  end
end
