class Authors::ElementsController < AuthorsController
  before_action :set_post
  before_action :set_element, only: [:update, :destroy]

  def create
    @element = @post.elements.build(element_params)
    notice = @element.save ? nil : @element.errors.full_messages.join(". ") << "."
    redirect_to edit_post_path(@post), notice: notice
  end

  def update
    @element.update(element_params)
    respond_to do |format|
      format.html { redirect_to edit_post_path(@element.post) }
      format.js
    end
  end

  def destroy
    @element.destroy
    redirect_to edit_post_path(@element.post)
  end

  private
    def set_post
      @post = current_author.posts.find(params[:post_id])
    end

    def set_element
      @element = @post.elements.find(params[:id])
    end

    def element_params
      params.require(:element).permit(:element_type, :content, :image)
    end
end
