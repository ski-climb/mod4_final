class LinksController < ApplicationController
  before_action :require_login

  def index
    @link = Link.new
    @links = current_user.links.most_recent
  end
end
