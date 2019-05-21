module Api
  class StoriesController < ApplicationController
    def index
      render json: { stories: {} }
    end

    def create
      render json: { validation: {}, is_save: {} }
    end
  end
end
