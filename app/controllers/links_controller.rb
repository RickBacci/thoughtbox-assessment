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

  def edit
    @link = Link.find(params[:id])
  end

  def update_status
    link = current_user.links.find(params[:link][:id])

    link.update(status: toggle_link_status(link))
    redirect_to root_path
  end

  private

  def toggle_link_status(link)
    return false if link.status
    true
  end

  def link_params
    params.require(:link).permit(:url, :title)
  end
end
