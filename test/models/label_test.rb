# frozen_string_literal: true

# == Schema Information
#
# Table name: labels
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class LabelTest < ActiveSupport::TestCase
  setup do
    @label = labels(:ruby_on_rails)
  end

  test "has a valid factory" do
    assert @label.valid?
  end

  context "associations" do
    should have_many(:article_labels)
    should have_many(:articles).through(:article_labels)
  end

  context "validations" do
    should validate_presence_of(:name)
  end
end
