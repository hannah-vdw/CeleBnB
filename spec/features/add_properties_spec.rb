feature 'Add properties' do

  # As a registered user 
  # So that I can make more money 
  # I want to add a property with a name, description and price
  scenario 'add a property with name, description and price' do
    sign_up_user
    visit('/sessions/new')
    sign_in_user
    click_button('Add a Property')
    add_a_property
    expect(page).to have_current_path('/properties')
    expect(page).to have_content("Goncalos mansion")
    expect(page).to have_content("A very nice place")
    expect(page).to have_content(1000)
  end

  # As a registered user 
  # So that I can make even more money 
  # I want to be able to list multiple properties
  scenario 'add multiple properties with name, description and price' do
    sign_up_user
    visit('/sessions/new')
    sign_in_user
    click_button('Add a Property')
    add_two_properties
    expect(page).to have_current_path('/properties')
    expect(page).to have_content "Goncalos mansion" && "A very nice place" && 1000
    expect(page).to have_content "The Niesoth Estate" && "A super nice place" && 2000
  end

  # As a registered user
  # So that my property can be booked
  # I want to be able to provide available dates
  scenario 'provide available dates' do
    visit('/')
    sign_up_user
    visit('/sessions/new')
    sign_in_user
    click_button('Add a Property')
    add_two_properties
    expect(page).to have_content '01/07/2021' && '07/07/2021' && '10/08/2021' && '17/08/2021'
  end

end

