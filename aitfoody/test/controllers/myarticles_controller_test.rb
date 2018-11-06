require 'test_helper'

class MyarticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get myarticles_index_url
    assert_response :success
  end

end
