# As a new user
# So that I can use CeleBnB
# I need to sign up as a registered user with a username, email and password

feature 'User can sign up' do
    scenario 'User can sign up with username, email and password' do
        visit('/')
        fill_in('username', with: 'bozzaj10')
        fill_in('email', with: 'borisj@example.com')
        fill_in('password', with: 'blondeshavemorefun')
        click_button('Sign up')
        expect(page).to have_current_path('/sessions/new')
        expect(page).to have_content('Welcome to CeleBnB bozzaj10!')
    end
end