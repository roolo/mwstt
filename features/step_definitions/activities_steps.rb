When /^I fill activity form$/ do
  within("#new_activity") do
    fill_in 'Name', with: @data_object.name
    
    click_button 'activity_submit'
  end
end
