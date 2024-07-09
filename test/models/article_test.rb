# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#  id           :bigint           not null, primary key
#  title        :string
#  body         :string
#  published_on :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  slug         :string
#
require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  setup do
    @article = articles(:hello_world)
  end

  test "has a valid factory" do
    assert @article.valid?
  end

  context "associations" do
    should have_many(:article_labels)
    should have_many(:labels).through(:article_labels)
  end

  context "validations" do
    should validate_presence_of(:title)
    should validate_presence_of(:body)
    should validate_presence_of(:published_on)
  end
end
