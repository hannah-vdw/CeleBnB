feature 'Add a property' do
  scenario 'add a property with name, description and price' do
    visit('/properties')
    click_button('Add a Property')
    expect(page).to have_current_path('/properties/new')
    fill_in('name', with: "Goncalos mansion")
    fill_in('description', with: "A very nice place")
    fill_in('price', with: 1000)
    click_button('Submit')
    expect(page).to have_current_path('/properties')
    expect(page).to have_content("Goncalos mansion")
    expect(page).to have_content("A very nice place")
    expect(page).to have_content(1000)
  end
end