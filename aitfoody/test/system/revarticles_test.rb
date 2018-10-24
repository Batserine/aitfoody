require "application_system_test_case"

class RevarticlesTest < ApplicationSystemTestCase
  setup do
    @revarticle = revarticles(:one)
  end

  test "visiting the index" do
    visit revarticles_url
    assert_selector "h1", text: "Revarticles"
  end

  test "creating a Revarticle" do
    visit revarticles_url
    click_on "New Revarticle"

    fill_in "Content", with: @revarticle.content
    fill_in "Keywords", with: @revarticle.keywords
    fill_in "Location", with: @revarticle.location
    fill_in "Price", with: @revarticle.price
    fill_in "Rating", with: @revarticle.rating
    fill_in "Title", with: @revarticle.title
    click_on "Create Revarticle"

    assert_text "Revarticle was successfully created"
    click_on "Back"
  end

  test "updating a Revarticle" do
    visit revarticles_url
    click_on "Edit", match: :first

    fill_in "Content", with: @revarticle.content
    fill_in "Keywords", with: @revarticle.keywords
    fill_in "Location", with: @revarticle.location
    fill_in "Price", with: @revarticle.price
    fill_in "Rating", with: @revarticle.rating
    fill_in "Title", with: @revarticle.title
    click_on "Update Revarticle"

    assert_text "Revarticle was successfully updated"
    click_on "Back"
  end

  test "destroying a Revarticle" do
    visit revarticles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Revarticle was successfully destroyed"
  end
end
