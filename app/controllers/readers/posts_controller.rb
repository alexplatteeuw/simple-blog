class Readers::PostsController < ReadersController
  def show
    @post = Post.published.friendly.find(params[:id])
  end
end