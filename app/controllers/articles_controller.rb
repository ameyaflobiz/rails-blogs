class ArticlesController < ApplicationController
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed 
  def index
    Article.triggerException
    @articles=Article.all
    ReportWorker.perform_async("07-01-2021","08-01-2021")
    render text:"Request added to queue"
  rescue Article::KuchTohError
    render json:{message:"Error aaya hai"}
  end

  def show
    @article=Article.find(params[:id])
  end

  def new
    @article=Article.new
  end

  def edit
    @article= Article.find(params[:id]) 
  end

  def update
    @article=Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def create
    @article=Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @article=Article.find(params[:id])
    @article.destroy!
    redirect_to root_path
  end
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
    
    def not_destroyed
      render json: {} ,status: :unprocessable_entity
    end
end
