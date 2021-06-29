class Property
  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'celebnb_test')
    else
      connection = PG.connect(dbname: 'celebnb')
    end

    result = connection.exec("SELECT * FROM properties;")
  end
end