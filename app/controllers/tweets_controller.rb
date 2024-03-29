class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  #新しいtweetを作成
  def new
    @tweet = Tweet.new
  end
end
