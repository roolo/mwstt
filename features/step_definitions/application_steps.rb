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