class User
  attr_reader :username, :email, :password, :id

  def initialize(username:, email:, password:, id:)
    @username = username
    @email = email
    @password = password
    @id = id
  end

  def self.signup(username:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'celebnb_test')
    else
        connection = PG.connect(dbname: 'celebnb')
    end

    result = connection.exec_params("INSERT INTO users (username, email, password) VALUES($1, $2, $3);", [username, email, password])
  end

  def self.signin(username:, password:)
    if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'celebnb_test')
    else
        connection = PG.connect(dbname: 'celebnb')
    end

    result = connection.exec_params("SELECT * FROM users WHERE username = $1 AND password = $2;", [username, password])

    if result.ntuples == 0 
        nil
    else 
        User.new(username: result[0]['username'], password: result[0]['password'], email: result[0]['email'], id: result[0]['id'])
    end
  end
end
