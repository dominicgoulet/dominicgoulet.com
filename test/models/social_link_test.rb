# frozen_string_literal: true

require "test_helper"

class SocialLinkTest < ActiveSupport::TestCase
  def setup
    @social_link = SocialLink.new(
      caption: "Sample Caption",
      href: "https://example.com",
      svg_path: "some.svg"
    )
  end

  # Test validations
  test "should be valid with valid attributes" do
    assert @social_link.valid?
  end

  test "should be invalid without a caption" do
    @social_link.caption = nil
    assert_not @social_link.valid?
    assert_includes @social_link.errors[:caption], "can't be blank"
  end

  test "should be invalid without an href" do
    @social_link.href = nil
    assert_not @social_link.valid?
    assert_includes @social_link.errors[:href], "can't be blank"
  end

  test "should be invalid without an svg_path" do
    @social_link.svg_path = nil
    assert_not @social_link.valid?
    assert_includes @social_link.errors[:svg_path], "can't be blank"
  end
end
