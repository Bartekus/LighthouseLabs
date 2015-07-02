class Post

  attr_accessor :title, :url, :points, :item_id, :comments

  def initialize
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @comments = []
  end

  def add_comment(comment)
    @comments << comment
  end

end


