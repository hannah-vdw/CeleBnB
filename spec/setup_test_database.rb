require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'celebnb_test')
  connection.exec("TRUNCATE properties;")
end

def add_rows_to_test_database
  connection = PG.connect(dbname: 'celebnb_test')
  connection.exec("INSERT INTO properties (name, description, price) values ('A Castle', 'The most wonderful', 500);")
  connection.exec("INSERT INTO properties (name, description, price) values ('Another Castle', 'The least wonderful', 10);")
end
