class User

    def self.signup(username:, email:, password:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'celebnb_test')
        else
            connection = PG.connect(dbname: 'celebnb')
        end

        result = connection.exec("INSERT INTO users (username, email, password) VALUES('#{username}', '#{email}', '#{password}');")
 
    end
end