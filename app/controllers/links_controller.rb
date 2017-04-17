class LinksController < ApplicationController
  before_action :require_login

  def index
    @link = Link.new
    @links = current_user.links.most_recent
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)
    if @link.save
      flash[:success] = "Link successfully updated"
      redirect_to root_path
    else
      @errors = @link.errors
      render :edit
    end
  end

  private

    def link_params
      params.require(:link).permit(:url, :title)
    end
end
