module Api
  class StoriesController < ApplicationController
    def index
      render json: Story.all
    end

    def create
      story = Story.new(title: story_params['title'], summary: story_params['text'])

      if story.save
        story.page.new(name: story_params['title'], text: story_params['text'])
        if story.page.save
          render json: { validation: {}, story_id: story.id, page_id: story.page.id }
        end
        render json: { validtion: {} }
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
