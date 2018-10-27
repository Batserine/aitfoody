require 'test_helper'

class BackendControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  # test "the truth" do
  #   assert true
  # end
 setup do
    sign_in users(:one)
  end
end
