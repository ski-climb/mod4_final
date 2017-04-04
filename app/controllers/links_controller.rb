class LinksController < ApplicationController
  before_action :require_login

  def index
    @links = current_user.links
    render file: 'public/404' unless users_page?
  end

  private

    def users_page?
      current_user && current_user.id.to_s == params[:user_id]
    end
end
