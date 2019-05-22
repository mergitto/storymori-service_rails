module Api
  class PagesController < ApplicationController
    def index
      page = Page
                .select(:id, :name, :text)
                .where(id: page_params['page_id'], story_id: page_params['story_id'])
                .first
      render json: { id: page.id, name: page.name, text: page.text, children: Page.next_page(page.id) }
    end

    def create
      page = Page.new(
        story_id: page_params[:story_id],
        parent_id: page_params[:parent_id],
        name: page_params[:page][:name],
        text: page_params[:page][:text]
      )
      render json: page if page.save
    end

    private

    def page_params
      params.permit(:story_id, :page_id, :parent_id, page: [:name, :text])
    end
  end
end
