feature 'Add properties' do

  # As a registered user 
  # So that I can make more money 
  # I want to add a property with a name, description and price
  scenario 'add a property with name, description and price' do
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
    add_two_properties
    expect(page).to have_current_path('/properties')
    expect(page).to have_content("Goncalos mansion")
    expect(page).to have_content("A very nice place")
    expect(page).to have_content(1000)
    expect(page).to have_content("The Niesoth Estate")
    expect(page).to have_content("A super nice place")
    expect(page).to have_content(2000)
  end
end

