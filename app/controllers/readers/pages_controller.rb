class Readers::PagesController < ReadersController
  def home
    @posts = Post.published.most_recently_published
  end
end
