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
  end

  def index
    @tools = Tool.all
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :description, :owner)
  end
end