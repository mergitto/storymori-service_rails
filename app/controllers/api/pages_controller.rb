module Api
  class PagesController < ApplicationController
    def index
      render json: { pages: {} }
    end

    def create
      render json: { validation: {}, is_save: {} }
    end
  end
end
