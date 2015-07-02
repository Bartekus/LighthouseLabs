require_relative 'raw_data'
require_relative 'post'
require_relative 'comment'

class Parser

  # Hacker News parser
  def self.hacker_news(url)
    begin
      page         = RawData.new(url)
      url          = page.raw_data.css('td.title a').map { |link| link['href'] }
      comments     = page.raw_data.css('td .default')

      post         = Post.new
      post.title   = page.raw_data.css('td.title a').text
      post.url     = url[0]
      post.points  = page.raw_data.css('.score').text
      post.item_id = page.raw_data.css('.score')[0]['id'][6..-1]

      comments.each do |comment|
        comhead             = comment.css('.comhead').text.split(' ')
        new_comment         = Comment.new
        new_comment.poster  = comhead[0]
        new_comment.comment = comment.css('.comment').text
        post.add_comment(new_comment)
      end
    rescue Exception
      Interface.no_read
      exit
    end
    post
  end

  # Reddit parsing
  def self.reddit(url)
    begin
      page         = RawData.new(url)
      url          = page.raw_data.css(' .title a.title.may-blank').map { |link| link['href'] }
      comments     = page.raw_data.css('div .entry')

      post         = Post.new
      post.title   = page.raw_data.css(' .title a.title.may-blank').text
      post.url     = url[0]
      post.points  = page.raw_data.css('div.score .number').text
      post.item_id = 'Unknown'

      comments.shift  # purge garbage
      comments.each do |comment|
        poster_raw          = comment.css('a').text.split('(')
        new_comment         = Comment.new
        new_comment.poster  = poster_raw[0][3..-1]
        new_comment.comment = comment.css('div.md p').text
        post.add_comment(new_comment) unless ((new_comment.poster.include? 'd more comments ') || (new_comment.comment.include? '[deleted]' ))
      end
    rescue Exception
      Interface.no_read
      exit
    end
    post
  end
end
