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

Then("I should see a link for site admin") do
  expect(page).to have_link('SiteAdmin', href: rails_admin_path())
end

When("I click the link for site admin") do
  find_link('SiteAdmin', href: rails_admin_path()).click
end

Then("I should see the dashboard that show the list of all models") do
  expect(page).to have_selector('table th', text: 'Model name')
  expect(page).to have_selector('table th', text: 'Last created')
  expect(page).to have_selector('table th', text: 'Records')
end

When("I click the link for manage users") do
  find_link('Users', href: '/admin/user').click
end

Then("I should see the list of registered users") do
  expect(page).to have_selector('table th', text: 'Email')
  expect(page).to have_selector('table th', text: 'Created at')
  expect(page).to have_selector('table th', text: 'Updated at')
  page.has_xpath?('//table/tr')
end
#------Ban User-----
When("I click edit button for updating user's information") do
  find(:xpath, "//table//tr[td[contains(.,\"#{@user.id}\")]] //a[contains(@href, '/admin/user/#{@user.id}/edit')]").click
end

Then("I should see a checkbox for inactive a user") do
  expect(page).to have_selector('#user_active_status')
end

When("I click uncheck at active status for inactive a user") do
  uncheck('Active status')
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

#-------Add Approve/Reject & Comment---------
When("I click the link for manage reviews food articles") do
  find_link('Revarticles', href: '/admin/revarticle').click
end

Then("I should see the list of reviews food articles") do
  expect(page).to have_selector('table th', text: 'Title')
  expect(page).to have_selector('table th', text: 'Content')
  expect(page).to have_selector('table th', text: 'Rating')
  expect(page).to have_selector('table th', text: 'Price')
  page.has_xpath?('//table/tr')
end

When("I click edit button for updating an article's information") do
  find(:xpath, "//table//tr[td[contains(.,\"#{@article.id}\")]] //a[contains(@href, '/admin/revarticle/#{@article.id}/edit')]").click
end

Then("I should see a checkbox and message box for approving an article") do
  expect(page).to have_selector('#revarticle_approved')
  expect(page).to have_selector('#revarticle_message')
end

When("I click checkbox at approve status and write some messages for approve article.") do
  check('Approved')
  fill_in('Message', :with => 'approved successfully')
end