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
        property_result = connection.exec("SELECT * FROM properties WHERE name = 'The Niesoth Estate';")
        click_button "#{property_result.first['id']}"
        expect(page).to have_current_path("/properties/#{property_result.first['id']}")
        fill_in('booking_date', with: '2021-10-08')
        click_button('Book')
        booking_result = connection.exec("SELECT * FROM bookings WHERE property_id = #{property_result.first['id']};")
        user_result = connection.exec("SELECT * FROM users WHERE id = #{booking_result.first['user_id']};")
        expect(page).to have_current_path('/requests')
        expect(page).to have_content("Congratulations #{user_result.first['username']}, your booking at #{property_result.first['name']} for #{booking_result.first['booking_date']}!")
    end
end
