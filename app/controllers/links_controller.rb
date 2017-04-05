class LinksController < ApplicationController
  before_action :require_login

  def index
    @link = Link.new
    @links = current_user.links.most_recent
    render file: 'public/404' unless current_user
  end
end
