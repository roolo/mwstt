When /^I fill project form$/ do
  within("#new_project") do
    fill_in 'Name', with: @data_object.name
    
    click_button 'project_submit'
  end
end