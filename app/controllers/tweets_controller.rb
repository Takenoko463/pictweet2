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

  #一致するツイートをデータから見つけ出し、削除。
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end

  #編集対象のツイートをindex変数に代入
  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to root_path
  end

  #ツイートの詳細pageを表示
  def show
    @tweet = Tweet.find(params[:id])
  end

  private

  def tweet_params
    params.require(:tweet).permit(:name, :image, :text)
  end
end
