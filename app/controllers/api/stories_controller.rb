module Api
  class StoriesController < ApplicationController
    def index
      render json: Story.all
    end

    def create
      story = Story.new(title: story_params['title'], summary: story_params['text'])

      if story.save
        render json: { validation: {}, story_id: story.id, page_id: 1 }
      else
        render json: { validtion: {} }
      end
    end

    private

    def story_params
      params
        .permit(:title, :text)
    end
  end
end
