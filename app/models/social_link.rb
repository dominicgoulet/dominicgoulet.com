# frozen_string_literal: true

class SocialLink < ApplicationRecord
  # Validations
  validates :caption, presence: true
  validates :href, presence: true
  validates :svg_path, presence: true
end
