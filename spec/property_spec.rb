# require 'property'

  describe Property do
    describe '.all' do
      it 'returns all properties' do
        add_rows_to_test_database
        properties = Property.all
        expect(properties.ntuples).to eq 2
      end
    end
  
    describe '.add' do
      it 'adds a new property' do
          connection = PG.connect(dbname: 'celebnb_test')
          name = "Goncalos mansion"
          description = "A very nice place"
          price = 1000
          available_from = "01/07/2021"
          available_until = "07/07/2021"
          Property.add(name: name, description: description, price: price, available_from: available_from, available_until: available_until)
          result = connection.exec("SELECT * FROM properties;")
          expect(result[0]['name']).to eq("Goncalos mansion")
          expect(result[0]['description']).to eq("A very nice place")
          expect(result[0]['price']).to eq("1000")
          expect(result[0]['available_from']).to eq("01/07/2021")
          expect(result[0]['available_until']).to eq("07/07/2021")
      end
    end

  describe '.book' do
    it 'allows the user to book' do
      add_rows_to_test_database
      sign_up_user
      connection = PG.connect(dbname: "celebnb_test")
      result = connection.exec("SELECT * FROM properties WHERE name = 'A Castle';")
      user_result = connection.exec("SELECT * FROM users WHERE username = 'bozzaj10';")
      Property.book(id: result.first['id'], booking_date: '2021-06-07', user_id: user_result.first['id'])
      booking_result = connection.exec_params("SELECT * FROM bookings WHERE property_id = $1;", [result.first['id']])
      expect(booking_result.first['booking_date']).to eq('2021-06-07')
      expect(booking_result.first['user_id']).to eq(user_result.first['id'])
    end
  end
end
