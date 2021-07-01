feature 'can book property' do
    
    # As a registered user
    # So that I can ditch my partner
    # I want to book a property for one night

    scenario 'user can book a property for one night' do
        sign_up_user
        visit('/sessions/new')
        sign_in_user
        click_button('Add a Property')
        add_two_properties
        connection = PG.connect(dbname: "celebnb_test")
        result = connection.exec("SELECT * FROM properties WHERE name = 'The Niesoth Estate';")
        click_button "#{result.first['id']}"
        expect(page).to have_current_path("/properties/#{result.first['id']}")
        fill_in('booking-date', with: '10/08/2021')
        click_button('Book')
        expect(page).to have_current_path('/requests')
        expect(page).to have_content("Congratulations bozzaj10, your booking at #{result.first['name']} for 10/08/2021!")
    end

end


