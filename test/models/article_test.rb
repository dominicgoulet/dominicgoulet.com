# frozen_string_literal: true

require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  setup do
    @article = Article.new(
      title: "Sample Article",
      body: "This is the body of the sample article.",
      published_on: Date.today,
      slug: "sample-article"
    )
  end

  # Test associations
  test "should have many article_labels" do
    assert_respond_to @article, :article_labels
  end

  test "should have many labels through article_labels" do
    assert_respond_to @article, :labels
  end

  # Test validations
  test "should be valid with valid attributes" do
    assert @article.valid?
  end

  test "should be invalid without a title" do
    @article.title = nil
    assert_not @article.valid?
    assert_includes @article.errors[:title], "can't be blank"
  end

  test "should be invalid without a body" do
    @article.body = nil
    assert_not @article.valid?
    assert_includes @article.errors[:body], "can't be blank"
  end

  test "should be invalid without a published_on date" do
    @article.published_on = nil
    assert_not @article.valid?
    assert_includes @article.errors[:published_on], "can't be blank"
  end

  test "should be invalid with a duplicate slug" do
    duplicate_article = @article.dup
    @article.save!
    assert_not duplicate_article.valid?
    assert_includes duplicate_article.errors[:slug], "has already been taken"
  end

  # Test ActiveText
  test "should have rich text body" do
    assert @article.respond_to?(:body)
  end

  # Test scopes
  test "latest scope should order by published_on desc" do
    assert_equal Article.latest.to_sql, Article.order(published_on: :desc).to_sql
  end

  # Test callbacks
  test "should set slug before validation on create" do
    article_without_slug = Article.new(
      title: "Another Sample Article",
      body: "This is another sample article body.",
      published_on: Date.today
    )
    article_without_slug.valid?
    assert_equal "another-sample-article", article_without_slug.slug
  end

  # Ensure the private method is not accessible
  test "private set_slug method should not be accessible" do
    assert_raises(NoMethodError) { @article.set_slug }
  end
end
