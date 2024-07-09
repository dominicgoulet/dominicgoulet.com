# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_social_links

  private

  def set_social_links
    @social_links = SocialLink.all.order(caption: :asc)
  end
end
