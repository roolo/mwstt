Given /^a logged in user$/ do
  @user = Factory(:user)
  visit('/login')
  fill_in('Username', :with => @user.username)
  fill_in('Password', :with => @user.password)
  click_button('Submit')
end

Given /^a data for (\w*)$/ do |entity|
  @data_object = Factory entity.to_sym
end

When /I visit the ([\w]*)\s{0,1}page for the ([\w]*)/ do |action, controller|
  params = {
    controller: controller, 
    action:     action.empty? ? 'index' : action,
    only_path:  true
  }
  visit(url_for(params))
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should see success notice$/ do
  page.should have_content("was successfully created.")
end