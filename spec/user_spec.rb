describe User do
    describe '.signup' do
        it 'signs up a user to CeleBnB' do
            connection = PG.connect(dbname: 'celebnb_test')
            sign_up_user
            result = connection.exec('SELECT * FROM users;')
            expect(result[0]['username']).to eq('bozzaj10')
            expect(result[0]['email']).to eq('borisj@example.com')
            expect(result[0]['password']).to eq('blondeshavemorefun')
        end
    end

    describe '.signin' do
        it 'signs in a user to CeleBnB' do
            connection = PG.connect(dbname: 'celebnb_test')
            sign_up_user
            first_user = User.signin(username: 'bozzaj10', password: 'blondeshavemorefun')
            expect(first_user.username).to eq('bozzaj10')
            expect(first_user).to be_a User
            expect(first_user.id).not_to be nil
        end
    end

end

