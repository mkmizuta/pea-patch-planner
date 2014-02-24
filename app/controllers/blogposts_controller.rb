class BlogpostsController < ApplicationController
  before_action :check_for_admin, only: [:new, :create, :edit, :destroy]

  def new
    @blogpost = Blogpost.new
  end

  def create
    @blogpost = Blogpost.new(blogpost_params)
    if @blogpost.save
      User.all.each do |user|
        if user.email
          # UserMailer.newpost(@blogpost.id, user.id).deliver

          Resque.enqueue(NewsJob, @blogpost.id, user.id)
        end
      end
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
                  :title, :post_text, :user_id, :pic_upload))
      redirect_to @blogpost
    else
      redirect_to edit_blogpost_path(@blogpost)
    end
  end

  def destroy
    Blogpost.find(params[:id]).destroy!

    redirect_to root_path
  end

  def check_for_admin
    if current_user.admin
      return
    else
      redirect_to '/blogposts'
    end
  end

  private

  def blogpost_params
    params.require(:blogpost).permit(:title, :post_text, :user_id, :pic_upload)
  end
end
