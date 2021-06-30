class Property
  def self.add(name:, description:, price:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'celebnb_test')
        else
            connection = PG.connect(dbname: 'celebnb')
        end

        result = connection.exec("INSERT INTO properties (name, description, price) VALUES('#{name}', '#{description}', '#{price}');")
    
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'celebnb_test')
    else
      connection = PG.connect(dbname: 'celebnb')
    end

    result = connection.exec("SELECT * FROM properties;")
  end
end
