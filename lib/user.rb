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

        result = connection.exec("INSERT INTO users (username, email, password) VALUES('#{username}', '#{email}', '#{password}');")
    end

    def self.signin(username:, password:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'celebnb_test')
        else
            connection = PG.connect(dbname: 'celebnb')
        end

        result = connection.exec("SELECT * FROM users WHERE username = '#{username}' AND password = '#{password}';")

        if result.ntuples == 0 
            nil
        else 
            User.new(username: result[0]['username'], password: result[0]['password'], email: result[0]['email'], id: result[0]['id'])
        end
    end


end