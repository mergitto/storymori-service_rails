module Api
  class PagesController < ApplicationController
    def index
      page = Page.find_by(id: page_params[:page_id])
      render json: { pages: {}, page: page }
    end

    def create
      p params
      render json: { validation: {}, is_save: {} }
    end

    private

    def page_params
      params
        .permit(:story_id, :page_id)
    end
  end
end
