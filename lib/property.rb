class Property
  def self.add(name:, description:, price:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'celebnb_test')
        else
            connection = PG.connect(dbname: 'celebnb')
        end

        result = connection.exec_params("INSERT INTO properties (name, description, price) VALUES($1, $2, $3);", [name, description, price])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'celebnb_test')
    else
      connection = PG.connect(dbname: 'celebnb')
    end

    result = connection.exec("SELECT * FROM properties;")
  end

  def self.book(id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'celebnb_test')
    else
      connection = PG.connect(dbname: 'celebnb')
    end
    result = connection.exec_params("SELECT * FROM properties WHERE id = $1;", [id])
    "Your booking of #{result.first['name']} has been confirmed, enjoy!"
  end
end

