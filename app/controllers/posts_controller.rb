class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @book = Book.find(params[:book_id])
    @post = @book.posts.new(params_post)
    @post.user = current_user

    if @post.save
      redirect_to root_path, notice: '文章新增成功'
    else
      render :new
    end
  end

    def show
      @post = Post.find(params[:id])
    end

    def edit
      @post = current_user.posts.find(params[:id])
    end

    def update
      @post = current_user.posts.find(params[:id])
      if @post.update(params_post)
        redirect_to root_path, notice:'編輯成功'
      else
        render :edit
      end
    end

  private
  def params_post
    params.require(:post).permit(:title, :content)
  end
end