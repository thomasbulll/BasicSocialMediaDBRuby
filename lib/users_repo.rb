require_relative './users'

class UsersRepo
    def all
        users_array = []

        sql = 'SELECT * FROM users;'
        result = DatabaseConnection.exec_params(sql, [])

        result.each do |user|
            new_user = Users.new
            new_user.id = user['id']
            new_user.username = user['username']
            new_user.email = user['email']

            users_array << new_user
            puts new_user
        end
        return users_array
    end

    def find(id)

        users_array = []

        sql = "SELECT * FROM users WHERE id = #{id};"
        result = DatabaseConnection.exec_params(sql, [])

        result.each do |user|
            new_user = Users.new
            new_user.id = user['id']
            new_user.username = user['username']
            new_user.email = user['email']

            users_array << new_user
        end
        return users_array
    end

    def create(id, username, email)

        users_array = []

        sql = "INSERT INTO users (id, username, email) VALUES ('#{id}', '#{username}', '#{email}');"
        result = DatabaseConnection.exec_params(sql, [])

        result.each do |user|
            new_user = Users.new
            new_user.id = user['id']
            new_user.name = user['username']
            new_user.cooking_time = user['email']

            users_array << new_user
        end
        return users_array
    end

    def delete(id)

        users_array = []

        sql = "DELETE FROM users WHERE id = #{id};"
        result = DatabaseConnection.exec_params(sql, [])

        result.each do |user|
            users_array << user
        end
        return users_array

    end

    def find_with_posts(id)
        sql = 'SELECT users.id, users.username, users.email, posts.title, posts.views FROM users JOIN posts ON users.id = posts.user_id
        WHERE users.id = $1;'
        params = [id]
        result = DatabaseConnection.exec_params(sql, params)

        user = Users.new
        user.id = result.first['id']
        user.username = result.first['username']
        user.email = result.first['email']

        result.each do |value|
            p value

        end
        return user


    end
end