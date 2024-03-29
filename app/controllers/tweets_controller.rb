class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  #新しいtweetを作成
  def new
    @tweet = Tweet.new
  end

  #ツイートをデータベースに保存し、ルートパスへ戻す
  def create
    Tweet.create(tweet_params)
    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:name, :image, :text)
  end
end
