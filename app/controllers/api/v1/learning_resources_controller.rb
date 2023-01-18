class Api::V1::LearningResourcesController < ApplicationController
  def index
    country = params[:country]
    video = VideoFacade.get_video(params[:country])
    images = ImageFacade.get_images(params[:country])

    render json: LearningResourcesSerializer.learning_resources(country, video, images)
  end
end