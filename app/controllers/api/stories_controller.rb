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

      if story.save
        page = story.pages.build(name: story_params['title'], text: story_params['text'])
        if page.save
          render json: { storyId: story.id, pageId: page.id }
        end
      else
        render json: {}
      end
    end

    private

    def story_params
      params
        .permit(:title, :text)
    end
  end
end
