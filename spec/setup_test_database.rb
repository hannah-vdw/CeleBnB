require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'celebnb_test')
  connection.exec("TRUNCATE properties;")
end

def add_rows_to_test_database
  connection = PG.connect(dbname: 'celebnb_test')
  connection.exec("INSERT INTO properties (name, description, price, available_from, available_until) values ('A Castle', 'The most wonderful', 500, '01/07/2021', '07/07/2021');")
  connection.exec("INSERT INTO properties (name, description, price, available_from, available_until) values ('Another Castle', 'The least wonderful', 10, '01/07/2021', '07/07/2021');")
end
