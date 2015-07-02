class Interface

  def self.display_help
    puts "Please use the following format: ".blue
    puts "ruby scraper.rb *source* *url*".blue
    puts "Currently these are the source choices: ".blue
    puts "'hn' for Hacker News or 'rd' for Reddit.\n".blue
  end

  def self.invalid_arguments
    puts "\nInvalid Arguments!".red
  end

  def self.unable_to_load(url)
    puts "\n#{url}".red
    puts "Unable to load URL! Check your spelling!\n".red
    display_help
  end

  def self.no_read
    puts "\nURL does not appear to be formatted correctly.\n".red
    display_help
  end

  def self.command(arg1)
    case arg1
      when 'help' then self.display_help
    end
  end

  def self.display_post(post)
    display_comments(post)
    puts "From page:      " + "#{ARGV[1]}".light_yellow
    puts "Url:            " + post.url.blue
    puts "Title:          " + post.title.blue
    puts "ID:             " + post.item_id.blue
    puts "Score:          " + post.points.blue
    puts "Total Comments: " + post.comments.length.to_s.blue
  end

  def self.display_comments(post)
    post.comments.each do |comment|
      print "User " + comment.poster.blue + " has posted: \t" + comment.comment.green + "\n"
    end
  end
end
