# frozen_string_literal: true

class Article < ApplicationRecord
  # Associations
  has_many :article_labels
  has_many :labels, through: :article_labels

  # Validations
  validates :title, presence: true
  validates :body, presence: true
  validates :published_on, presence: true
  validates :slug, presence: true, uniqueness: true

  # ActiveText
  has_rich_text :body

  # Scopes
  scope :latest, -> { order(published_on: :desc).limit(2) }
end
