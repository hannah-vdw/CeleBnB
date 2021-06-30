feature 'can book property' do
    scenario 'user can book a property they like' do
        add_rows_to_test_database
        visit('/properties')
        connection = PG.connect(dbname: "celebnb_test")
        result = connection.exec("SELECT * FROM properties WHERE name = 'A Castle';")
        click_button "#{result.first['id']}"
        expect(page).to have_content 'Your booking of A Castle has been confirmed, enjoy!'
    end
end


