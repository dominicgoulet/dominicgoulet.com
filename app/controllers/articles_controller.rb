# frozen_string_literal: true

class ArticlesController < ApplicationController
  def show
    @article = Article.find_by(slug: params[:slug])
    not_found unless @article.present?
  end

  private

  def not_found
    raise ActionController::RoutingError, "Not Found"
  end
end
