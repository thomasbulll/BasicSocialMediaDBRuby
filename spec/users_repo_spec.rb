require 'users_repo'

RSpec.describe UsersRepo do

    def reset_recipes_table
        seed_sql = File.read('spec/seeds.sql')
        connection = PG.connect({host: '127.0.0.1', dbname: 'social_network_test' })
        connection.exec(seed_sql)
    end

    before(:each) do
        reset_recipes_table
    end
    #all
    it 'returns all the users' do
        user = UsersRepo.new
        all = user.all

        expect(all.length).to eq 4

        expect(all.first.username).to eq 'Lucy'
        expect(all.first.email).to eq 'Lucy@gmail.com'

    end

    #find

    it 'returns the data from a specific user' do
        users = UsersRepo.new
        find = users.find(4)

        expect(find.length).to eq 1

        expect(find.first.username).to eq 'George'
        expect(find.first.email).to eq 'George@gmail.com'
    end

    #create 

    it 'returns the data of the newest user' do
        user = UsersRepo.new
        new_user = Users.new
        new_user.username = 'John'
        new_user.email = 'John@gmail.com'
        new_user.id = '15'

        user.create(new_user.id, new_user.username, new_user.email)

        find = user.find(15)

        expect(find.length).to eq 1

        expect(find.first.username).to eq 'John'
        expect(find.first.email).to eq 'John@gmail.com'
    end
    #delete

    it 'deletes a specific user id' do
        user  = UsersRepo.new
        user.delete(4)

        all = user.all

        expect(all.length).to eq 3

        expect(all.first.username).to eq 'Lucy'
        expect(all.first.email).to eq 'Lucy@gmail.com'

    end

    #related
    it 'finds user with related posts' do
        repo = UsersRepo.new
        user = repo.find_with_posts(1)

        expect(user.username).to eq 'Lucy'
    end

end