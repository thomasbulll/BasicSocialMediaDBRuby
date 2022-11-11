require_relative 'lib/database_connection'
require_relative 'lib/users_repo'
require_relative 'lib/posts_repo'

class Application

    # The Application class initializer
    # takes four arguments:
    #  * The database name to call `DatabaseConnection.connect`
    #  * the Kernel object as `io` (so we can mock the IO in our tests)
    #  * the AlbumRepository object (or a double of it)
    #  * the ArtistRepository object (or a double of it)
    def initialize(social_network, io, users_repo, posts_repo)
      DatabaseConnection.connect(social_network)
      @io = io
      @users_repo = users_repo
      @posts_repo = posts_repo
    end
  
    def run
        @io.puts 'Hello, would you like to see a list of Users or Posts?'
        @io.puts 'Please Press 1 for Users and 2 for Posts'
        number = @io.gets.to_i

        if(number == 1)
            @io.puts "You have selected Users:"
            users = UsersRepo.new 

            users.all.each do |user| 
                p user
            end

        elsif(number == 2)
            @io.puts "You have selected Posts"
            posts = PostsRepo.new

            posts.all.each do |user| 
                p user
            end
        else
            @io.puts "You have selected an invalid number"
        end
      # "Runs" the terminal application
      # so it can ask the user to enter some input
      # and then decide to run the appropriate action
      # or behaviour.
  
      # Use `@io.puts` or `@io.gets` to
      # write output and ask for user input.
    end
  end
  
  #
  if __FILE__ == $0
    app = Application.new(
      'social_network',
      Kernel,
      UsersRepo.new,
      PostsRepo.new
    )
    app.run
  end