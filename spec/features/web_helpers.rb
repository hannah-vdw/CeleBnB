
def add_a_property
  visit('/properties')
  click_button('Add a Property')
  expect(page).to have_current_path('/properties/new')
  fill_in('name', with: "Goncalos mansion")
  fill_in('description', with: "A very nice place")
  fill_in('price', with: 1000)
  fill_in('available_from', with: '01/07/2021')
  fill_in('available_until', with: '07/07/2021')
  click_button('Submit')
end

def add_two_properties
  add_a_property
  visit('/properties')
  click_button('Add a Property')
  expect(page).to have_current_path('/properties/new')
  fill_in('name', with: "The Niesoth Estate")
  fill_in('description', with: "A super nice place")
  fill_in('price', with: 2000)
  fill_in('available_from', with: '10/08/2021')
  fill_in('available_until', with: '17/08/2021')
  click_button('Submit')
end