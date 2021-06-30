describe Property do
  describe '#all' do
    it 'returns all properties' do
      add_rows_to_test_database
      properties = Property.all
      expect(properties.ntuples).to eq 2
    end
  end
  describe '.book' do
    it 'allows user to book' do
      add_rows_to_test_database
      connection = PG.connect(dbname: "celebnb_test")
      result = connection.exec("SELECT * FROM properties WHERE name = 'A Castle';")
      message = Property.book(result.first['id'])
      expect(message).to eq 'Your booking of A Castle has been confirmed, enjoy!'
    end
  end
end

