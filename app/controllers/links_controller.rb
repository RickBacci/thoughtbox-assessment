class LinksController < ApplicationController
  before_action :current_user

  def index
    if current_user
      @link  = current_user.links.new
      @links = current_user.links
    end
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      flash[:success] = "Your link was successfully created!"

      redirect_to links_path
    else
      flash[:failure] = "Link could not be created"

      redirect_to links_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end
end
