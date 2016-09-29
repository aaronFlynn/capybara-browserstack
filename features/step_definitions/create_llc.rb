Then(/^I create a standard other charge$/) do
  puts '----- OTHER Charge -----'

  # Navigate to Charge Type page
  page.should have_content('Insert a Charge')
  choose('ct-other')
  page.click_button('Continue')
  puts '[]Charge Type complete'

  # Navigate to the UPRN and Geometry page
  page.should have_content('UPRNs')
  page.should have_link('Back')
  step %(I create a point on the map)
  page.click_button('Continue')
  puts '[]Geometry complete'

  # Navigate to the Charge Description page
  page.should have_content('Charge Description')
  page.should have_link('Back')
  fill_in 'charge-description', with: @local_mand.description
  page.click_button('Continue')
  puts '[]Charge Description complete'

  # Navigate to the Stat Prov page
  page.should have_content('Please select up to 3 Statutory Provisions')
  # Ensure the session[:]tat prov page has all the current stat prov options displayed
  page.should have_content('Civil Aviation Act 1982 section 46(1)')
  page.should have_content('Clean Air Act 1993 section 18')
  page.should have_content('Countryside and Rights of Way Act 2000 section 16')
  page.should have_content('Housing Act 1985 section 156')
  page.should have_content('Land Drainage Act 1991 section 18(8)')
  page.should have_content('Planning (Listed Buildings and Conservation Areas) Act 1990 section 2(2)')
  page.should have_content('Planning (Listed Buildings and Conservation Areas) Act 1990 section 38')
  page.should have_content('Wildlife and Countryside Act 1981 section 28')

  check 'Land Drainage Act 1991 section 18(8'
  check 'Planning (Listed Buildings and Conservation Areas) Act 1990 section 2(2)'
  check 'Planning (Listed Buildings and Conservation Areas) Act 1990 section 38'

  page.click_button('Continue')
  puts '[]Stat Prov complete'

  # Navigate to the Instrument page
  page.should have_content('Select the instrument')
  page.should have_link('Back')
  choose('Deed')
  page.click_button('Continue')
  puts '[]Instrument complete'

  # Navigate to the Creation & Expiration Date page
  page.should have_content('Creation Date')
  page.should have_content('Expiration Date')
  page.should have_link('Back')
  step %(I enter the dates)
  page.click_button('Continue')
  puts '[]Creation & Exp date complete'

  # Navigate to the Originating Authority page
  page.should have_content('Originating Authority')
  select 'Royal Borough of Kingston upon Thames', from: 'originating-authority'
  page.click_button('Continue')
  puts '[]Originating Authority complete'

  # Navigate to the FIL and Refs page
  page.should have_content('Further Information Location 1')
  page.should have_content('Further Information Location 2')
  page.should have_content('Further Information Location 3')
  page.should have_content('Reference 1')
  page.should have_content('Reference 2')
  page.should have_content('Reference 3')
  page.should have_link('Back')
  select 'a@b.com', from: 'further-information-location-1'
  fill_in 'reference-1-1', with: @local_mand.inspection_reference_1
  page.click_button('Continue')
  puts '[]FIL and Refs complete'

  # Navigate to the Details Confirmation page
  page.should have_content('Confirmation of Details')
  page.should have_content('Charge Type')
  page.should have_content('Charge Description')
  page.should have_content('Instrument')
  page.should have_content('Creation Date')
  page.should have_content('Expiration Date')
  page.should have_content('Originating Authority')
  page.should have_content('Further Information Location 1')
  page.should have_content('Reference 1')
  page.should have_link('Back')
  puts '[]Confirmation Page complete'

  # On the Confirmation page, Check the Details we inputted
  chargetype = page.find('//*[@id="charge-type"]').value
  assert_equal(@local_mand.charge_type, chargetype)

  chargedesc = page.find('//*[@id="charge-description"]').value
  assert_equal(@local_mand.description, chargedesc)

  instrument = page.find('//*[@id="instrument"]').value
  assert_equal(@local_opt.instrument, instrument)

  cre_date = page.find('//*[@id="creation-date"]').value
  assert_equal(@local_opt.create_date, cre_date)

  exp_date = page.find('//*[@id="expiration-date"]').value
  assert_equal(@local_opt.exp_date, exp_date)

  origauth = page.find('//*[@id="orig-auth-display"]').text
  assert_equal('Royal Borough of Kingston upon Thames', origauth)

  fil = page.find('//*[@id="fil-display-1"]').text
  assert_equal(@local_mand.location_name_2, fil)

  page.click_button('Save')
end