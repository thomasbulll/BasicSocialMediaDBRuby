require 'posts_repo'
require 'pg'

RSpec.describe PostsRepo do

    def reset_table
        seed_sql = File.read('spec/seeds.sql')
        connection = PG.connect({host: '127.0.0.1', dbname: 'social_network_test' })
        connection.exec(seed_sql)
    end

    before(:each) do
        reset_table
    end

    #All
    it 'returns all the posts' do
        posts = PostsRepo.new
        all = posts.all

        expect(all.length).to eq 5

        expect(all.first.id).to eq '1'
        expect(all.first.title).to eq 'new phone'
        expect(all.first.content).to eq 'I got a new phone'
        expect(all.first.views).to eq '50'
        expect(all.first.user_id).to eq '1'

    end

    #Create
    it 'returns the data of the newest user' do
        post = PostsRepo.new
        new_post = Posts.new
        new_post.id = '6'
        new_post.title = 'NEW CAR!!'
        new_post.content = 'Hi guys I got a new Car'
        new_post.views = '1500'
        new_post.user_id = '2'

        post.create(new_post.id, new_post.title, new_post.content, new_post.views, new_post.user_id)

        find = post.find(6)

        expect(find.length).to eq 1

        expect(find.first.id).to eq '6'
        expect(find.first.title).to eq 'NEW CAR!!'
        expect(find.first.content).to eq 'Hi guys I got a new Car'
        expect(find.first.views).to eq '1500'
        expect(find.first.user_id).to eq '2'
    end
    #Delete

    it 'deletes a specific post id' do
        post = PostsRepo.new
        post.delete('1')

        all = post.all

        expect(all.length).to eq 4

        expect(all.first.id).to eq '2'
        expect(all.first.title).to eq 'new phone'
        expect(all.first.content).to eq 'I got a new phone'
        expect(all.first.views).to eq '1000'
        expect(all.first.user_id).to eq '1'

    end
end