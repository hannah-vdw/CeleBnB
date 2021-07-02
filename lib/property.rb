class Property
  
  def self.add(name:, description:, price:, available_from:, available_until:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'celebnb_test')
        else
            connection = PG.connect(dbname: 'celebnb')
        end

        result = connection.exec_params("INSERT INTO properties (name, description, price, available_from, available_until) VALUES($1, $2, $3, $4, $5);", [name, description, price, available_from, available_until])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'celebnb_test')
    else
      connection = PG.connect(dbname: 'celebnb')
    end

    result = connection.exec("SELECT * FROM properties;")
  end

  def self.book(id:, booking_date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'celebnb_test')
    else
      connection = PG.connect(dbname: 'celebnb')
    end
    result = connection.exec_params("INSERT INTO bookings (property_id, booking_date) VALUES($1, $2);", [id.to_i, booking_date])
    
  end
end

