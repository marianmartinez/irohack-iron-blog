class Blog

  def initialize
    @posts = []
  end

  def add_post(post)
    @posts << post 
  end


  def publish_front_page
    create_front_page
    @posts
  end

  private

  def create_front_page
    sort_posts   
    @posts = @posts.map do |post|
      post.title + "\n" + "*" * 10 + "\n" +
      post.text + "\n" + "-" * 10
    end
  end
  
  def sort_posts
    @posts = @posts.sort_by{|post| post.date}.reverse
  end


end

class Post

  attr_accessor :date
  attr_accessor :text

  def initialize (title, date, text, sponsored)
    @title = title
    @date = date
    @text = text
    @sponsored = sponsored
  end

  def title

    if @sponsored 
      @title = '*' * 5 + @title + '*' * 5
    else
      @title =  @title
    end

  end

end

post1 = Post.new "Post 1 Title", Time.new(2010, 02, 07), 'Sed risus risus', true
post2 = Post.new "Post 2 Title", Time.new(2011, 04, 07), 'Sed cursus tempor', false
post3 = Post.new "Post 3 Title", Time.new(2014, 10, 07), 'Loren ipsum dolor', true
#puts post1.title 
#puts post1.date
#puts post1.text

blog1 = Blog.new
blog1.add_post(post1)
blog1.add_post(post2)
blog1.add_post(post3)

puts blog1.publish_front_page