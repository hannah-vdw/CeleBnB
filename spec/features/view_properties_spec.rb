# As a registered user
# So that I can go on holiday
# I want to view all the properties
feature 'user can view all the properties' do
  scenario 'when visiting CeleBnB' do
    add_rows_to_test_database
    visit '/properties'
    expect(page).to have_content 'A Castle' && 'The most wonderful' && 500
    expect(page).to have_content 'Another Castle' && 'The least wonderful' && 10
  end
end