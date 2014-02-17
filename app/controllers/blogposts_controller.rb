class BlogpostsController < ApplicationController
  def new
    @blogpost = Blogpost.new
  end

  def create
    @blogpost = Blogpost.new(blogpost_params)
    if @blogpost.save
      redirect_to blogpost_path(@blogpost.id)
      flash[:notice] = "You have created a new blog"
    else
      render 'new'
    end
  end

  def show
    @blogpost = Blogpost.find(params[:id])
  end

  def index
    @blogposts = Blogpost.all
  end

  def edit
    @blogpost = Blogpost.find(params[:id])

  end

  def update
    @blogpost = Blogpost.find(params[:id])

    if params.key?(:blogpost) && @blogpost.update(params[:blogpost].permit(
                  :title, :text, :user_id, :pic_upload))
      redirect_to @blogpost
    else
      redirect_to edit_blogpost_path(@blogpost)
    end
  end

  def destroy
    Blogpost.find(params[:id]).destroy!

    redirect_to root_path
  end

  private

  def blogpost_params
    params.require(:blogpost).permit(:title, :post_text, :user_id, :pic_upload)
  end
end
