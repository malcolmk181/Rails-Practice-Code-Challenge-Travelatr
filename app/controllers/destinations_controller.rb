class DestinationsController < ApplicationController
    def index
        @destinations = Destination.all
    end

    def show
        @destination = Destination.find(params[:id])
        @recent_five = @destination.posts.order(created_at: :desc).limit(5)
        @featured = @destination.posts.order(likes: :desc).first
    end
end