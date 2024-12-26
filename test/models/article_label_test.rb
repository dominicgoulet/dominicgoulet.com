# frozen_string_literal: true

require "test_helper"

class ArticleLabelTest < ActiveSupport::TestCase
  # Setup method to create instances of Article and Label
  def setup
    @article = articles(:hello_world) # Assuming you have fixtures or factories set up
    @label = labels(:ruby_on_rails)     # Assuming you have fixtures or factories set up
    @article_label = ArticleLabel.new(article: @article, label: @label)
  end

  # Test valid article_label
  test "should be valid with valid attributes" do
    assert @article_label.valid?
  end

  # Test invalid without an article
  test "should be invalid without an article" do
    @article_label.article = nil
    assert_not @article_label.valid?
  end

  # Test invalid without a label
  test "should be invalid without a label" do
    @article_label.label = nil
    assert_not @article_label.valid?
  end
end
