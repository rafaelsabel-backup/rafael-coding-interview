class TweetsController < ApplicationController
  def index
    tweets = Tweet.by_user(params[:user_username]).order(created_at: :desc).limit(15)
    tweets = tweets.where('tweets.id < ?', params[:last_id]) if params[:last_id].present?

    render json: tweets
  end
end
