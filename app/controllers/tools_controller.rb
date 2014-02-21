class ToolsController < ApplicationController
  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      redirect_to tool_path(@tool)
    else
      flash[:notice] = "There was a problem with your inputs"
      render :new
    end
  end

  def show
    @tool = Tool.find(params[:id])
    @tools_users = ToolsUsers.new
  end

  def index
    @tools = Tool.all
    @tools_users = ToolsUsers.new
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(tool_params)
      redirect_to @tool
    else
      flash[:notice] = "There was a problem updating your tool"
      render :edit
    end
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy!

    redirect_to tools_path
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :description, :owner)
  end
end