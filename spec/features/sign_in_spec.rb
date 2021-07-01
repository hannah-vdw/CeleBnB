# As a registered user
# So that I can see my listings
# I need to sign in as a registered user

feature 'User can sign in' do
  scenario 'User can sign in with username and password' do
    add_rows_to_test_database
    visit('/sessions/new')
    fill_in('username', with: 'bozzaj10')
    fill_in('password', with: 'blondeshavemorefun')
    click_button('Sign in')
    expect(page).to have_current_path('/properties')
    expect(page).to have_content('Where are you heading to next, bozzaj10?')
    expect(page).to have_content 'A Castle' && 'The most wonderful' && 500
    expect(page).to have_content 'Another Castle' && 'The least wonderful' && 10
  end

  scenario 'User can navigate to sign in page from the home page' do
    visit '/'
    click_link 'Sign in'
    expect(page).to have_current_path '/sessions/new'
    expect(page).to have_button 'Sign in'
  end
end