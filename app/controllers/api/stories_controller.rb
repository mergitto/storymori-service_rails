module Api
  class StoriesController < ApplicationController
    def index
      render json: Story
                      .joins(:pages)
                      .merge(Page.where(parent_id: nil))
                      .select('stories.id, stories.title, pages.id as parentId')
    end

    def create
      story = Story.new(title: story_params['title'], summary: story_params['text'])
      page = story.pages.build(name: story_params['title'], text: story_params['text'])

      ActiveRecord::Base.transaction do
        story.save!
        page.save!
      end
      render json: { storyId: story.id, pageId: page.id }
      rescue => e
        render_error_status(e)
    end

    private

    def render_error_status(error)
      render json: { errors: error }, status: 422
    end

    def story_params
      params.permit(:title, :text)
    end
  end
end
