#--- Creating a Reviews Food Article-----
Given("I am a reviewer") do
  # @reviewer = FactoryBot.create :reviewer
  @reviewer = FactoryBot.create(:reviewer, id: 7)
end

Given("I want to create reviews food articles") do
  @article2 = FactoryBot.build :article2
  puts '--@article2---'
  puts @reviewer.id
  puts @article2.title
  puts @article2.user_id
end

Given("I am a reviewer signed in") do
  visit '/'
  click_link('Sign in')
  fill_in 'Email', with: @reviewer.email
  fill_in 'Password', with: @reviewer.password
  click_button 'Log in'
end

Then("I should see a link for managing my reviews food articles") do
  puts @reviewer.id
  puts @reviewer.role.name
  # expect(page).to have_content('My Articles')
  expect(page).to have_link('My Articles', href: myRevarticles_path())
end

When("I click the link for managing my reviews food articles") do
  find_link('My Articles', href: myRevarticles_path()).click
end

Then("I should see the list of my reviews food articles") do
  expect(page).to have_selector('table th', text: 'Title')
  expect(page).to have_selector('table th', text: 'Content')
  expect(page).to have_selector('table th', text: 'Rating')
  expect(page).to have_selector('table th', text: 'Price')
  page.has_xpath?('//table/tr')
end

When("I click button for creating an new article") do
  find_link('New Revarticle', href: '/revarticles/new').click
end

Then("I should see a form for adding article's information") do
  expect(page).to have_selector('form')
  find('#typefood').find(:xpath, 'option[1]').select_option
end

When("I fill article's information and click save button") do

    fill_in 'Title', with:  @article2.title
    fill_in 'Content', with:  @article2.content
    fill_in 'Rating', with:  @article2.rating
    fill_in 'Price', with:  @article2.price
    # second_option_xpath = "//*[@id='typefood']/option[1]"
    # second_option = find(:xpath, second_option_xpath).text
    # select(second_option, :from => "typefood")
    find(:select, "typefood").first(:option, 'Snack').select_option

    fill_in 'Location', with: @article2.location
    click_button('Create Revarticle')

end

Then("I should see a message which notify that reviews food article was created successfully") do
  # expect(page).to have_content('Revarticle was successfully created.')
  expect(page).to have_css("#notice", :text => "Revarticle was successfully created.")
end

#------Editing a Reviews Food Article Information -------
Given("I want to update reviews food articles") do

  @article2 = FactoryBot.create :article2
  puts '--@article3---'
  puts @reviewer.id
  puts @article2.id
  puts @article2.title
  puts @article2.user_id
end

# When("I click button for updating article's information") do
#   # expect(page).to have_content('Edits')
#   find(:xpath, "//table/tbody/tr/td/a[contains(@href, '/revarticles/#{@article2.id}/edit')]").click
#
# end
#
# Then("I should see a form for editing article's information") do
#   pending # Write code here that turns the phrase above into concrete actions
# end
#
# When("I update article's information and click save button") do
#   pending # Write code here that turns the phrase above into concrete actions
# end
#
# Then("I should see a message which notify that reviews food article was updated successfully") do
#   pending # Write code here that turns the phrase above into concrete actions
# end

# ------Delete--------------
Given("I want to delete reviews food articles") do
  @article2 = FactoryBot.create :article2
end
When("I click button for deleting article's information") do
  find(:xpath, "//table/tbody/tr/td/a[contains(@data-method, 'delete')]").click
  #@href, '/revarticles/#{@article2.id}' ,
end

Then("I should see a message which notify that reviews food article was deleted successfully") do
  expect(page).to have_css("#notice", :text => "Revarticle was successfully destroyed.")
end
# -----View approve/reject status ----
Given("I want to see the status of reviews food articles") do
  @article2 = FactoryBot.create :article2
end

Then("I should see a approve or reject status and a comment from an admin") do
  expect(page).to have_selector('table th', text: 'Approved')
end