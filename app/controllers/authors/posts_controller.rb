class Authors::PostsController < AuthorsController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = current_author.posts
  end

  def new
    @post = current_author.posts.build
  end

  def edit
    @element = @post.elements.build
  end

  def create

    @post = current_author.posts.build(post_params)

    if @post.save
      redirect_to edit_post_path(@post)
    else
      render :new
    end
  end

  def update
    
    if @post.update(post_params)
      redirect_to edit_post_path(@post)
    else
      @element = Element.new
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    def set_post
      @post = current_author.posts.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description, :header_image)
    end
end
