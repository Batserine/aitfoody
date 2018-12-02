require 'test_helper'

class MyarticlesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "should get index" do
    get myarticles_index_url
    assert_response :success,  @response.body
  end

end
