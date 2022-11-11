require_relative './posts'

class PostsRepo

    #all
    def all
        posts_array = []

        sql = 'SELECT * FROM posts;'
        result = DatabaseConnection.exec_params(sql, [])

        result.each do |post|
            new_post = Posts.new
            new_post.id = post['id']
            new_post.title = post['title']
            new_post.content = post['content']
            new_post.views = post['views']
            new_post.user_id = post['user_id']

            posts_array << new_post
        end
        return posts_array

    end
    #find
    def find(id)
        posts_array = []

        sql = "SELECT * FROM posts WHERE id = #{id};"
        result = DatabaseConnection.exec_params(sql, [])

        result.each do |post|
            new_post = Posts.new
            new_post.id = post['id']
            new_post.title = post['title']
            new_post.content = post['content']
            new_post.views = post['views']
            new_post.user_id = post['user_id']

            posts_array << new_post
        end
        return posts_array

    end
    #create
    def create(id, title, content, views, user_id)

        posts_array = []

        sql = "INSERT INTO posts (id, title, content, views, user_id) VALUES ('#{id}', '#{title}', '#{content}', '#{views}', '#{user_id}');"
        result = DatabaseConnection.exec_params(sql, [])

        result.each do |post|
            new_post = Posts.new
            new_post.id = post['id']
            new_post.title = post['title']
            new_post.content = post['content']
            new_post.views = post['views']
            new_post.user_id = post['user_id']

            posts_array << new_post
        end
        return posts_array
    end

    
    #delete
    def delete(id)
        posts_array = []

        sql = "DELETE FROM posts WHERE id = #{id};"
        result = DatabaseConnection.exec_params(sql, [])

        result.each do |user|
            posts_array << user
        end
        return posts_array

    end
end