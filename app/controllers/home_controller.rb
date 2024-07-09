# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @articles = Article.latest.includes(:labels)
  end
end
