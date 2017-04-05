class Api::V1::LinksController < ApplicationController
  before_action :require_login

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(read_params)
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  def create
    @link = Link.new(link_params)
    @link.user = current_user
    if @link.save
      render partial: 'links/link', locals: { link: @link }, layout: false
    else
      @errors = @link.errors
      render partial: 'shared/errors', status: 500
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end

  def read_params
    params.permit(:read)
  end
end
