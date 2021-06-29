describe Property do
  describe '#all' do
    it 'returns all properties' do
      add_rows_to_test_database
      properties = Property.all
      expect(properties.ntuples).to eq 2
    end
  end
end