# frozen_string_literal: true

require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @article = articles(:hello_world) # Assuming you have an article fixture or factory
  end

  test "should get show" do
    get article_url(slug: @article.slug)

    assert_response :success
    assert_template :show
  end

  test "should raise not found for invalid slug" do
    assert_raises(ActionController::RoutingError) do
      get article_url(slug: "non-existent-slug")
    end
  end
end
