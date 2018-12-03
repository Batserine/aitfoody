require 'test_helper'

class BackendControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    sign_in users(:one)
  end
end
