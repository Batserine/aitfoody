require 'test_helper'

class RevarticlesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:one)
    @revarticle = revarticles(:one)
  end

  test "should get index" do
    get revarticles_url
    assert_response :success
  end

  test "should get new" do
    get new_revarticle_url
    assert_response :success
  end

  test "should create revarticle" do
    assert_difference('Revarticle.count') do
      post revarticles_url, params: { revarticle: { content: @revarticle.content, keywords: @revarticle.keywords, location: @revarticle.location, price: @revarticle.price, rating: @revarticle.rating, title: @revarticle.title } }
    end

    assert_redirected_to revarticle_url(Revarticle.last)
  end

  test "should show revarticle" do
    get revarticle_url(@revarticle)
    assert_response :success
  end

  test "should get edit" do
    get edit_revarticle_url(@revarticle)
    assert_response :success
  end
#@revarticle.title
  test "should update revarticle" do
    patch revarticle_url(@revarticle), params: { revarticle: { content: @revarticle.content, keywords: @revarticle.keywords, location: @revarticle.location, price: @revarticle.price, rating: @revarticle.rating, title: "Taro" } }
    assert_redirected_to revarticle_url(@revarticle)
  end

  test "should destroy revarticle" do
    assert_difference('Revarticle.count', -1) do
      delete revarticle_url(@revarticle)
    end

    assert_redirected_to revarticles_url
  end
end
