describe Booking do
  describe '.get' do
    it 'returns the booking of a given user' do
      add_rows_to_test_database
      sign_up_user
      
      connection = PG.connect(dbname: "celebnb_test")
      property_result = connection.exec("SELECT * FROM properties WHERE name = 'A Castle';")
      user_result = connection.exec("SELECT * FROM users WHERE username = 'bozzaj10';")
      
      Property.book(id: property_result.first['id'], booking_date: '2021-06-07', user_id: user_result.first['id'])
      booking_result = connection.exec_params("SELECT * FROM bookings WHERE property_id = $1;", [property_result.first['id']])
      booking = Booking.get(user_id: user_result.first['id'])

      expect(booking.booking_date).to eq '2021-06-07'
      expect(booking.username).to eq user_result.first['username']
      expect(booking.property_name).to eq property_result.first['name']
    end
  end
end