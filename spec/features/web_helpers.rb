
def add_a_property
  expect(page).to have_current_path('/properties/new')
  fill_in('name', with: "Goncalos mansion")
  fill_in('description', with: "A very nice place")
  fill_in('price', with: 1000)
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
  click_button('Submit')
end

def sign_up_user 
  username = 'bozzaj10'
  email = 'borisj@example.com'
  password = 'blondeshavemorefun'
  User.signup(username: username, email: email, password: password)
end

def sign_in_user
  username = 'bozzaj10'
  password = 'blondeshavemorefun'
  fill_in('username', with: username)
  fill_in('password', with: password)
  click_button('Sign in')
end