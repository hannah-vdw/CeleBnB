describe User do
    describe '.signup' do
        it 'signs up a user to CeleBnB' do
            connection = PG.connect(dbname: 'celebnb_test')
            username = 'bozzaj10'
            email = 'borisj@example.com'
            password = 'blondeshavemorefun'
            User.signup(username: username, email: email, password: password)
            result = connection.exec('SELECT * FROM users;')
            expect(result[0]['username']).to eq('bozzaj10')
            expect(result[0]['email']).to eq('borisj@example.com')
            expect(result[0]['password']).to eq('blondeshavemorefun')
        end
    end

end

