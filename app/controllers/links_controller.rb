class LinksController < ApplicationController
  before_action :require_login

  def index
    @links = current_user.links
    render file: 'public/404' unless current_user
  end
end
