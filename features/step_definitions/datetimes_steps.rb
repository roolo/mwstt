When /^I fill datetime form$/ do
  within("#new_datetime") do
    # Start time
    select(@data_object.start.year.to_s,  :from => 'datetime_start_1i')
    select(@data_object.start.strftime("%B").to_s, :from => 'datetime_start_2i')
    select(@data_object.start.day.to_s,   :from => 'datetime_start_3i')
  
    select(@data_object.start.strftime("%H").to_s,  :from => 'datetime_start_4i')
    select(@data_object.start.strftime("%M").to_s,  :from => 'datetime_start_5i')
    
    # Stop time
    select(@data_object.stop.year.to_s,  :from => 'datetime_stop_1i')
    select(@data_object.stop.strftime("%B").to_s, :from => 'datetime_stop_2i')
    select(@data_object.stop.day.to_s,   :from => 'datetime_stop_3i')

    select(@data_object.stop.strftime("%H").to_s,  :from => 'datetime_stop_4i')
    select(@data_object.stop.strftime("%M").to_s,  :from => 'datetime_stop_5i')

    fill_in 'Description', with: @data_object.description

    click_button 'datetime_submit'
  end
end

Then /^I should see complete datetime form$/ do
  page.should have_css('label:contains(Activity)')
  page.should have_css('label:contains(Start)')
  page.should have_css('label:contains(Stop)')
  page.should have_css('label:contains(Description)')
end