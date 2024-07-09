# frozen_string_literal: true

# == Schema Information
#
# Table name: article_labels
#
#  id         :bigint           not null, primary key
#  article_id :bigint           not null
#  label_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class ArticleLabelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
