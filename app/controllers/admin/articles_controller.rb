# frozen_string_literal: true

module Admin
  class ArticlesController < AdminController
    before_action :set_article, only: %w[edit update destroy]

    def index
      @articles = Article.all.order(published_on: :desc)
    end

    def new
      @article = Article.new(published_on: Date.today)
    end

    def create
      @article = Article.new(article_params)

      if @article.save
        redirect_to admin_articles_path, notice: "Sucessfully created article."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @article.update(article_params)
        redirect_to admin_articles_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if @article.destroy
        redirect_to admin_articles_path, notice: "Sucessfully deleted article."
      else
        redirect_to admin_articles_path, alert: @article.errors.full_messages.join(", ")
      end
    end

    private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :slug, :published_on, :body)
    end
  end
end
