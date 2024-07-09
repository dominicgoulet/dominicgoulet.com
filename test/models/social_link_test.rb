# frozen_string_literal: true

# == Schema Information
#
# Table name: social_links
#
#  id         :bigint           not null, primary key
#  caption    :string
#  href       :string
#  svg_path   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class SocialLinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
