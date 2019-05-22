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

      ActiveRecord::Base.transaction do
        story.save!
        page = story.pagesuild(name: story_params['title'], text: story_params['text'])
        page.save!
        render json: { storyId: story.id, pageId: page.id }
      end
      rescue => e
        render_error_status(e)
    end

    private

    def render_error_status(error)
      render json: { errors: error }, status: 400
    end

    def story_params
      params.permit(:title, :text)
    end
  end
end
