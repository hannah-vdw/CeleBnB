require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'celebnb_test')
  connection.exec("TRUNCATE properties;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'celebnb_test')
  connection.exec("INSERT INTO properties (name, description, price) values ('A Castle', 'The most wonderful', 500);")
end
