#------See registered users-----
Given("I am an admin") do
  @admin = FactoryBot.create :admin
end

Given("there is the articles") do
  @article = FactoryBot.create :article
end

Given("I want to see all registered users") do
  @user = FactoryBot.build :user
end

Given("I am signed in") do
  visit '/'
  click_link('Sign in')
  fill_in 'Email', with: @admin.email
  fill_in 'Password', with: @admin.password
  click_button 'Log in'
end

When("I visit the article page") do
  visit '/revarticles'
end

Then("I should see a link for the manage user") do
  expect(page).to have_link('Registered Users', href: manageUser_path())
end

When("I click the link for the manage user") do
  find_link('Registered Users', href: manageUser_path()).click
end

Then("I should see the list of registered users") do
  expect(page).to have_selector('table')
end
#------Ban User-----
When("I click the checkbox for ban a user") do
  # find(:checkbox, "ban_cb[0]").set(true)
  find(:css, "#ban_cb_0", :visible => false).click
end

#------Statistics-----
Then("I should see a link for the statistics") do
  expect(page).to have_link('Statistics', href: statistics_path())
end

When("I click the link for the statistics") do
  find_link('Statistics', href: statistics_path()).click
end

Then("I should see the charts of registered users") do
  find(:css, '#chart-1').text
  find(:css, '#chart-2').text
  # chart registered users group by sex and registered users  group by date
end