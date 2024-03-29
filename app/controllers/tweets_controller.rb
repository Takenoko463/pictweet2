class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

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
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to root_path
  end

  #ツイートの詳細pageを表示
  def show
  end

  private

  def tweet_params
    params.require(:tweet).permit(:name, :image, :text).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  #サインイン状態によって移行先を分類
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
