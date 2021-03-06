class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
    @articles_ordered = @articles.sort_by { |article| article.created_at }.reverse
  end

  def show
    @reviews = @article.reviews
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :profession, :content, :photo, :photo_cache)
  end
end
