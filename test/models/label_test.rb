# frozen_string_literal: true

require "test_helper"

class LabelTest < ActiveSupport::TestCase
  def setup
    @label = Label.new(name: "Sample Label")
  end

  # Test associations
  test "should have many article_labels" do
    assert_respond_to @label, :article_labels
  end

  test "should have many articles through article_labels" do
    assert_respond_to @label, :articles
  end

  # Test validations
  test "should be valid with valid attributes" do
    assert @label.valid?
  end

  test "should be invalid without a name" do
    @label.name = nil
    assert_not @label.valid?
    assert_includes @label.errors[:name], "can't be blank"
  end

  # Test callbacks
  test "should not destroy label with associated articles" do
    @label.save!
    article = Article.create!(title: "Sample Article", body: "Sample body", published_on: Date.today, slug: "sample-article")
    ArticleLabel.create!(article: article, label: @label)

    assert_no_difference("Label.count") do
      @label.destroy
    end

    assert_includes @label.errors[:base], "Cannot delete label while articles exist that reference it"
  end

  test "should destroy label without associated articles" do
    @label.save!

    assert_difference("Label.count", -1) do
      @label.destroy
    end
  end

  # Ensure the private method is not accessible
  test "private check_for_articles method should not be accessible" do
    assert_raises(NoMethodError) { @label.check_for_articles }
  end
end
